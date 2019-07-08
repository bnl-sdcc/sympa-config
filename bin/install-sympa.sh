#!/bin/bash -e
#
#  RHEL 7 install sympa, sympa-www w/ postfix, sqlite back-end
#


GITRAW="https://raw.githubusercontent.com/bnl-sdcc/sympa-config/master"

echo "Installing/confirming sympa core..."
wget -q $GITRAW/etc/sympa.repo -O /etc/yum.repos.d/sympa.repo
yum install sympa 

touch /var/lib/sympa/sympa.sqlite
chown sympa:sympa /var/lib/sympa/sympa.sqlite

wget -q $GITRAW/etc/sympa.conf -O /etc/sympa/sympa.conf

wget -q $GITRAW/etc/aliases.sympa.postfix -O /etc/sympa/aliases.sympa.postfix


chown sympa:sympa /etc/sympa/aliases.sympa.postfix.db
sudo -u sympa postalias hash:/etc/sympa/aliases.sympa.postfix
postalias hash:/etc/sympa/aliases.sympa.postfix

touch /etc/sympa/aliases.sympa.sendmail
chmod 640 /etc/sympa/aliases.sympa.sendmail
chown sympa:sympa /etc/sympa/aliases.sympa.sendmail

sympa_newaliases.pl

sympa.pl --health_check

systemctl enable sympa.service
service sympa restart



echo "Installing/confirming sympa www..."

yum install sympa-httpd mhonarc spawn-fcgi


