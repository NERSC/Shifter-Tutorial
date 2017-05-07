if [ $(grep -c squash /proc/filesystems) -eq 0 ] ;then
  echo "Please load the squashfs module"
  exit
fi

[ -e /data/db ] || mkdir /data/db

[ -e /data/images/cache ] || mkdir -p /data/images/cache

echo "Starting services"
mongod --smallfiles --fork --logpath=/var/log/mongodb/mongo.log --pidfilepath /mongo.pid  &
sleep 2
if [ ! -e "/proc/$(cat /mongo.pid)/" ] ; then
  echo "Mongo not running"
  echo "Check for a stale lock file"
  exit 1
fi

redis-server > /var/log/redis.log 2>&1 &
dd if=/dev/urandom of=/etc/munge/munge.key count=1
chown munge /etc/munge/munge.key
chmod 600 /etc/munge/munge.key
runuser -u munge -- /usr/sbin/munged  --force -F &

echo "Starting Shifter Services"
/usr/bin/gunicorn -b 0.0.0.0:5000 --backlog 2048 --access-logfile=/var/log/shifter_imagegw/access.log --log-file=/var/log/shifter_imagegw/error.log shifter_imagegw.api:app >> shifter.log 2>&1 &
celery -A shifter_imagegw.imageworker worker -Q mycluster -n 1 --loglevel=debug --logfile=/var/log/shifter_imagegw/mycluster.log >> shifter-worker.log 2>&1 &


