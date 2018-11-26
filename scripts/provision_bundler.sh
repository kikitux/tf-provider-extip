#!/usr/bin/env bash

# install git ruby ruby-dev
which git ruby ruby-dev &>/dev/null || {
  sudo apt-get install -y git ruby ruby-dev
}
cd /vagrant
gem install bundler
bundle install
