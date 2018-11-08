FROM centos

RUN \ 
    yum -y install epel-release && \
    yum -y install mongodb-server mongodb wget

RUN \
    URL=http://portal.nersc.gov/project/bigdata/shifter/ && \
    yum -y install $URL/shifter-18.03.0-1.nersc.el7.centos.x86_64.rpm \
    $URL/shifter-imagegw-18.03.0-1.nersc.el7.centos.x86_64.rpm \
    $URL/shifter-fasthash-18.03.0-1.nersc.el7.centos.x86_64.rpm \
    $URL/shifter-runtime-18.03.0-1.nersc.el7.centos.x86_64.rpm


RUN \
    useradd auser -m && \
    getent passwd >> /etc/shifter/shifter_etc_files/passwd

ADD ./config/ /src/
RUN \
    cp /src/imagemanager.json /src/udiRoot.conf /etc/shifter/

RUN yum -y install git && \
    sed -i "s|'r:gz'|'r:gz', errors='replace'|" /usr/lib64/python2.7/site-packages/shifter_imagegw/dockerv2.py
    
