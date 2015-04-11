#! /bin/bash
set -e

# How to use
#
#  You can use it by sourcing /etc/profile.d/rbenv.sh from your login shell.
#  and install ruby using ruby-build: rbenv install <version>

# part 0: install rbenv and plugins
# CAUTION: here is no Ruby installation

##########################################
# dependencies
#
env DEBIAN_FRONTEND=noninteractive apt-get update
env DEBIAN_FRONTEND=noninteractiv apt-get -y install git-core

##########################################
# install rbenv
#
git clone https://github.com/sstephenson/rbenv.git /opt/rbenv

# Add rbenv to the path:
echo '# rbenv setup' > /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT=/opt/rbenv' >> /etc/profile.d/rbenv.sh
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

chmod +x /etc/profile.d/rbenv.sh

############################################
# plugins
#
# install rbenv-sudo
mkdir /opt/rbenv/plugins
git clone git://github.com/dcarley/rbenv-sudo.git /opt/rbenv/plugins/rbenv-sudo

# Install ruby-build as rbenv plugin
git clone git://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build

exit 0
