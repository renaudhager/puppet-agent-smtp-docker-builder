FROM centos:6.6

RUN \
yum install -y  \
  gcc gcc-c++ patch readline readline-devel zlib zlib-devel rpm-build \
  libyaml-devel libffi-devel openssl-devel make \
  bzip2 autoconf automake libtool bison iconv-devel \
  git curl which tar yum-plugin-downloadonly rpm2cpio

RUN \
  curl -s -O https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm && \
  rpm -ivh puppetlabs-release-pc1-el-6.noarch.rpm

COPY files/* /app/

ENV PATH=/usr/local/rvm/bin:/usr/local/rvm/gems/ruby-1.9.3*/bin:$PATH
ENV rvm_path /usr/local/rvm
ENV rvm_prefix /usr/local

# Install of ruby 1.9
RUN \
  gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && \
  curl -s -L get.rvm.io | bash -s stable && \
  rvm install 1.9.3 && \
  rvm use 1.9.3 --default && \
  for i in `find /usr/local/rvm/gems/ -maxdepth 1 -type d -name "ruby-1.9.3*"`;do echo $i ;cp -a ${i}/wrappers/* /usr/local/bin/;done;

RUN \
cd ~ && \
git clone https://github.com/jordansissel/fpm && \
cd fpm && \
gem install fpm && \
mkdir /build && \
chmod +x /app/build.sh

CMD "/app/build.sh"
