FROM ubuntu:17.04

ENV TERM xterm-256color

RUN apt-get -q update

RUN apt-get -qy install apt-utils
RUN apt-get -qy install bsdmainutils
RUN apt-get -qy install build-essential
RUN apt-get -qy install cmake
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
RUN apt-get -qy install gcc
RUN apt-get -qy install git
RUN apt-get -qy install htop
RUN apt-get -qy install jq
RUN apt-get -qy install make
RUN apt-get -qy install postgresql
RUN apt-get -qy install python
RUN apt-get -qy install python-dev
RUN apt-get -qy install python-pip
RUN apt-get -qy install sed
RUN apt-get -qy install sysstat
RUN apt-get -qy install tmux 
RUN apt-get -qy install unzip 
RUN apt-get -qy install vim
RUN apt-get -qy install wget
RUN apt-get -qy install zsh

RUN mkdir /src
WORKDIR /src

ENV CRIU 2.11.1
RUN curl http://download.openvz.org/criu/criu-$CRIU.tar.bz2 | tar -jxf-
RUN make -C criu-$CRIU
RUN cp criu-$CRIU/criu /usr/local/sbin

ADD wrapper /usr/local/sbin/
CMD ["wrapper"]
