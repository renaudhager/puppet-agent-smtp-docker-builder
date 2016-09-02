FROM ubuntu:14.04

ARG DEBIAN_FRONTEND=noninteractive

RUN \
echo "deb http://apt.puppetlabs.com trusty PC1" > /etc/apt/sources.list.d/puppetlabs-pc1.list && \
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys  1054B7A24BD6EC30 && \
apt-get update  && \
apt-get install -y build-essential git ruby-dev rpm gcc libedit-dev

COPY files/* /app/

RUN \
cd ~ && \
git clone https://github.com/jordansissel/fpm && \
cd fpm && \
gem install fpm && \
mkdir /build && \
chmod +x /app/build.sh

CMD "/app/build.sh"
