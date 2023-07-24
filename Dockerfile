FROM ubuntu:22.04
WORKDIR /home
RUN apt-get update &&  apt-get install -y  --fix-missing build-essential cmake libgmp3-dev gengetopt libpcap-dev flex byacc libjson-c-dev pkg-config libunistring-dev
ADD xmap-master /home/xmap-master
ADD domain.txt /home/domain.txt
ADD server.txt /home/server.txt
RUN cd xmap-master/ && cmake .
RUN cd xmap-master/ && make -j4
RUN cd xmap-master/ && make install xmap
# RUN /bin/bash
CMD ["xmap","-4","-x","32","-p","53","-M","dnsx","-O","json","-i","eth0","--output-fields=*","--output-filter=success = 1 && (repeat=0 || repeat=1)","-w","server.txt","-o","result.txt","--metadata-file=result_0724.log","-R","314","-P","4","--probe-args=raw:recurse:file:domain.txt"]