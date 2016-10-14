FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install -y wget libtommath-dev libicu-dev && \
    mkdir /root/fb && cd /root/fb && wget http://downloads.sourceforge.net/project/firebird/firebird-linux-amd64/2.5.6-Release/FirebirdSS-2.5.6.27020-0.amd64.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Ffirebird%2Ffiles%2Ffirebird-linux-amd64%2F2.5.6-Release%2F&ts=1476474933&use_mirror=netix && \
    tar xzvpf download && cd Firebird* && ./install.sh -silent && \
    echo "DatabaseAccess = Full" >>/opt/firebird/firebird.conf && \

WORKDIR /opt/firebird/bin

VOLUME [ "/databases" ]

EXPOSE 3050

ENTRYPOINT [ "./fbguard" ]
