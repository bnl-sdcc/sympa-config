#!/bin/bash -e
postmap /etc/postfix/virtual
postmap /etc/postfix/transport
postalias hash:/etc/sympa/aliases.sympa.postfix
postfix reload
