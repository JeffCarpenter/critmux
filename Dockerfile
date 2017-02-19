FROM ubuntu:14.04

RUN apt-get -q update

RUN apt-get -qy install bsdmainutils
RUN apt-get -qy install build-essential
RUN apt-get -qy install curl
RUN apt-get -qy install libprotobuf-c0-dev
RUN apt-get -qy install linux-headers-generic
RUN apt-get -qy install protobuf-c-compiler
RUN apt-get -qy install tmux
RUN apt-get -qy install bash
RUN apt-get -qy install bc
RUN apt-get -qy install bridge-utils
RUN apt-get -qy install curl
RUN apt-get -qy install docker
RUN apt-get -qy install git
RUN apt-get -qy install htop
RUN apt-get -qy install jq
RUN apt-get -qy install make
RUN apt-get -qy install postgresql
RUN apt-get -qy install python
RUN apt-get -qy install python-pip
RUN apt-get -qy install sed
RUN apt-get -qy install awk 
RUN apt-get -qy install sysstat
RUN apt-get -qy install tmux 
RUN apt-get -qy install unzip 
RUN apt-get -qy install vim
RUN apt-get -qy install wget
RUN apt-get -qy install zsh

RUN mkdir /src
WORKDIR /src

ENV CRIU 1.2
RUN curl http://download.openvz.org/criu/criu-$CRIU.tar.bz2 | tar -jxf-
RUN make -C criu-$CRIU
RUN cp criu-$CRIU/criu /usr/local/sbin

ADD wrapper /usr/local/sbin/
CMD ["wrapper"]
