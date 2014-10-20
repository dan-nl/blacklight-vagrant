#!/usr/bin/env bash

#
# environment vars
#
export BLACKLIGHT_APPLICATION_DIR=/vagrant/blacklight

#
# update apt-get
#
echo
echo 'updating apt-get'
echo '----------------'
apt-get update > /dev/null
echo 'apt-get updated'
echo


#
# check for unzip
#
echo
echo 'check for unzip'
echo '---------------'
if type -p unzip > /dev/null; then
	echo 'unzip already installed'
else
	echo 'installing unzip'
	apt-get install unzip -y
fi
echo


#
# check for curl
#
echo
echo 'check for curl'
echo '--------------'
if type -p curl > /dev/null; then
	echo 'curl already installed'
else
	echo 'installing curl'
	apt-get install curl -y
fi
echo


#
# check for nodejs
#
echo
echo 'check for nodejs v0.6.12'
echo '------------------------'
node_version="$(node -v 2>&1)"
if echo $node_version 2>&1 | grep -q 'v0.6.12'; then
	echo 'nodejs v0.6.12 already installed'
else
	echo 'installing nodejs'
	apt-get install nodejs -y
fi
echo


#
# check for git
#
echo
echo 'check for git 1.7.x'
echo '-------------------'
git_version="$(git --version 2>&1)"
if echo $git_version 2>&1 | grep -q 'git version 1.7'; then
	echo 'git already installed'
else
	echo 'installing git'
	apt-get install git -y
fi
echo


#
# check for java
#
echo
echo 'check for java jre 7'
echo '--------------------'
java_version="$(java -version 2>&1)"
if echo $java_version 2>&1 | grep -q 'java version "1.7'; then
	echo 'java jre 7 already installed'
else
	echo 'installing openjdk-7-jre-headless'
	apt-get install openjdk-7-jre-headless -y
fi
echo


#
# run sub-scripts as vagrant user
#
su -c "/vagrant/shell-scripts/rvm.sh" vagrant
su -c "/vagrant/shell-scripts/blacklight.sh" vagrant
