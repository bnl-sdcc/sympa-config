#!/bin/bash -e
service sympa stop
service wwsympa stop
service mariadb stop
service postfix stop


service postfix start
service mariadb start
service sympa start
service wwsympa start

