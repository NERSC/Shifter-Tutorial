FROM centos

RUN \ 
    yum -y install epel-release && \
    yum -y install mongodb-server mongodb wget

RUN \
    mkdir rpms && cd rpms && \
    wget http://portal.nersc.gov/project/bigdata/shifter/shifter-17.11.b1-1.nersc.el7.centos.x86_64.rpm && \
    wget http://portal.nersc.gov/project/bigdata/shifter/shifter-imagegw-17.11.b1-1.nersc.el7.centos.x86_64.rpm && \
    wget http://portal.nersc.gov/project/bigdata/shifter/shifter-debuginfo-17.11.b1-1.nersc.el7.centos.x86_64.rpm && \
    wget http://portal.nersc.gov/project/bigdata/shifter/shifter-runtime-17.11.b1-1.nersc.el7.centos.x86_64.rpm && \
    yum -y localinstall shifter-* && \
    cd .. && rm -rf rpms


RUN \
    useradd auser -m && \
    getent passwd >> /etc/shifter/shifter_etc_files/passwd

ADD ./config/ /src/
RUN \
    cp /src/imagemanager.json /src/udiRoot.conf /etc/shifter/
    
