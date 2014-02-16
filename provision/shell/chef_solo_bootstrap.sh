#!/usr/bin/env bash

sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
sudo apt-get -y install ruby1.9.3
sudo gem install chef ruby-shadow --no-ri --no-rdoc
