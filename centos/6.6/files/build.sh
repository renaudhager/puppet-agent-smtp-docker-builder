#!/bin/bash

# Exit on error
set -e

export PATH=/root/fpm/bin:$PATH

if [ -z "$PUPPET_VERSION" ]; then
 yum install --downloadonly --downloaddir=/tmp puppet-agent
 fpm_cmd="fpm"
else
  yum install -y --downloadonly --downloaddir=/tmp puppet-agent-${PUPPET_VERSION}
  fpm_cmd="fpm -v $PUPPET_VERSION"
fi

cd /build
rpm2cpio /tmp/puppet-agent-1.5.1-1.el6.x86_64.rpm | cpio  -idmv
cp /app/postfix_main.aug /build/opt/puppetlabs/puppet/share/augeas/lenses/dist/

$fpm_cmd -s dir -t rpm -n "puppet-agent-smtp-server" --description "puppet agent with modified postfix augeas lens."  -p /dist -C /build
