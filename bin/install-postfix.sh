#!/bin/bash -e
#
# Install postfix local only. 


GITRAW="https://raw.githubusercontent.com/bnl-sdcc/sympa-config/master"

echo "Installing/confirming postfix"
yum install postfix 
wget -q $GITRAW/etc/main.cf -O /etc/postfix/main.cf

bin/postfix-restart.sh


