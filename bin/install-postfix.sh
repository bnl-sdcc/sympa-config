#!/bin/bash -e

GITRAW="https://raw.githubusercontent.com/bnl-sdcc/sympa-config/master"

echo "Installing/confirming postfix"
yum install postfix 
cd /etc/postfix
wget $GITRAW/etc/main.cf -O main.cf
cd -





