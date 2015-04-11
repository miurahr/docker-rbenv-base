#! /bin/bash
set -e

# How to use
#
#  You can use it by sourcing /etc/profile.d/rbenv.sh from your login shell.
#

# part 0: install rbenv and plugins

##########################################
# dependencies
#
env DEBIAN_FRONTEND=noninteractive apt-get update
env DEBIAN_FRONTEND=noninteractiv apt-get -y install \
  build-essential \
  curl \
  unzip \
  git-core \
  gcc \
  g++ \
  make \
  bison \
  libgdbm-dev \
  libncursesw5-dev \
  libncurses5-dev \
  libreadline6-dev \
  tcl8.5-dev \
  tk8.5-dev \
  zlib1g-dev \
  libssl-dev \
  procps \
  libffi-dev \
  libyaml-dev \
  chrpath

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
source /etc/profile.d/rbenv.sh

##########################################
# Install ruby-build:
pushd /tmp
  git clone git://github.com/sstephenson/ruby-build.git
  cd ruby-build
  ./install.sh
popd

############################################
# plugins
#
# install rbenv-sudo
mkdir /opt/rbenv/plugins
git clone git://github.com/dcarley/rbenv-sudo.git /opt/rbenv/plugins/rbenv-sudo

