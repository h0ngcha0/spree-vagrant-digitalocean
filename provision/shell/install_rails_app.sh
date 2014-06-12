#!/usr/bin/env bash

echo "inside shell"
echo `pwd`

gem install rails -v 4.0.0 --no-ri --no-rdoc
gem install therubyracer --no-ri --no-rdoc
gem install libv8 --no-ri --no-rdoc


