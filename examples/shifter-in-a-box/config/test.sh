echo "Testing munge"
munge -n > /dev/null
if [ $? -ne 0 ] ; then
  echo "Munge not working"
  exit
fi

echo "Test pull"
shifterimg pull busybox
if [ $(shifterimg images|wc -l) -eq 0 ] ; then
  echo "Pull Failed"
  exit 1
fi
