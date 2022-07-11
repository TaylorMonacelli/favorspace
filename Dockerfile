FROM ubuntu:latest

RUN apt-get -qq update
RUN apt-get -qy install build-essential \
  binutils lintian debhelper dh-make devscripts
RUN apt-get -qy install git
