#!/bin/bash -e

GITRAW="http://git.racf.bnl.gov/gitea/jhover/sympa-config/raw/branch/master"

echo "Installing/confirming postfix"
yum install postfix 
cd /etc/postfix
wget $GITRAW/etc/main.cf -O main.cf
cd -





