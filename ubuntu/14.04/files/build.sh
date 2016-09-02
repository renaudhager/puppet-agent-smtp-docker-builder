#!/bin/bash

# Exit on error
set -e

if [ -z "$PUPPET_VERSION" ]; then
 apt-get download puppet-agent
 fpm_cmd="fpm"
else
  apt-get download puppet-agent=$PUPPET_VERSION
  fpm_cmd="fpm -v $PUPPET_VERSION"
fi

dpkg-deb -x puppet-agent*.deb  /build
cp /app/postfix_main.aug /build/opt/puppetlabs/puppet/share/augeas/lenses/dist/

$fpm_cmd -s dir -t deb -n "puppet-agent-smtp-server" --description "puppet agent with modified postfix augeas lens."  -p /dist -C /build
