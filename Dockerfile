FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install \
    build-essential binutils lintian debhelper \
    dh-make devscripts git gnupg2 curl
RUN version=$(curl --silent "https://api.github.com/repos/mondoohq/cnspec/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")' | tr -d v) && \
    curl -LO https://github.com/mondoohq/cnspec/releases/download/v${version}/cnspec_${version}_linux_amd64.deb && \
    dpkg -i cnspec_${version}_linux_amd64.deb && \
    cnspec version
