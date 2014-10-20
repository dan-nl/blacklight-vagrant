#!/usr/bin/env bash

# make sure rvm is available as a function
source /home/vagrant/.rvm/scripts/rvm


#
# check for rails
#
echo
echo 'check for Rails 4.1.6'
echo '---------------------'
rvm 1.9.3@blacklight 2>&1
rails_version="$(rails -v 2>&1)"
if echo $rails_version 2>&1 | grep -q 'Rails 4.1.6'; then
	echo 'rails Rails 4.1.6 already installed'
else
	echo 'installing Rails 4.1.6'
	gem install rails -v 4.1.6 --no-ri --no-rdoc
fi
echo


#
# check for application directory
#
echo
echo 'check for application directory'
echo '-------------------------------'
if [ -d $BLACKLIGHT_APPLICATION_DIR ]; then
	echo 'application directory exits'
else
	echo 'creating application directory'
	mkdir $BLACKLIGHT_APPLICATION_DIR

	cd $BLACKLIGHT_APPLICATION_DIR
	echo 'installing blacklight'
	rails new . -m https://raw.github.com/projectblacklight/blacklight/master/template.demo.rb
fi
echo
