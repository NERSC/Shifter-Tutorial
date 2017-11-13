FROM centos

RUN \ 
    yum -y install epel-release && \
    yum -y install mongodb-server mongodb wget

RUN \
    URL=http://portal.nersc.gov/project/bigdata/shifter/ && \
    yum -y install $URL/shifter-17.11.b2-1.nersc.el7.centos.x86_64.rpm \
    $URL/shifter-imagegw-17.11.b2-1.nersc.el7.centos.x86_64.rpm \
    $URL/shifter-fasthash-17.11.b2-1.nersc.el7.centos.x86_64.rpm \
    $URL/shifter-runtime-17.11.b2-1.nersc.el7.centos.x86_64.rpm


RUN \
    useradd auser -m && \
    getent passwd >> /etc/shifter/shifter_etc_files/passwd

ADD ./config/ /src/
RUN \
    cp /src/imagemanager.json /src/udiRoot.conf /etc/shifter/
    
