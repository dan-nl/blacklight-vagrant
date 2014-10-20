#!/usr/bin/env bash

#
# check for rvm
# Installing required packages: gawk, g++, libyaml-dev, libsqlite3-dev,
# sqlite3, autoconf, libgdbm-dev, libncurses5-dev, automake, libtool,
# bison, pkg-config, libffi-dev
#
echo
echo 'check for rvm'
echo '-------------'
cd
if [ -e /home/vagrant/.rvm/scripts/rvm ]; then
	echo 'rvm already installed'
	source /home/vagrant/.rvm/scripts/rvm
else
	echo 'installing rvm'
	curl -sSL https://get.rvm.io | bash -s stable
	source /home/vagrant/.rvm/scripts/rvm
	rvm requirements
fi
echo


#
# check for ruby 1.9.3
#
echo
echo 'check for ruby 1.9.3'
echo '--------------------'
ruby_version="$(rvm list 2>&1)"
if echo $ruby_version | grep -q 'ruby-1.9.3'; then
	echo 'ruby 1.9.3 already installed'
else
	echo 'installing ruby 1.9.3'
	rvm install 1.9.3
fi
echo


#
# check for gemset blacklight
#
echo
echo 'check for gemset blacklight'
echo '---------------------------'
gemset_list="$(rvm gemset list 2>&1)"
if echo $gemset_list 2>&1 | grep -q 'blacklight'; then
	echo 'gemset blacklight exists'
else
	echo 'creating gemset blacklight'
	rvm 1.9.3
	rvm gemset create blacklight
fi
echo
