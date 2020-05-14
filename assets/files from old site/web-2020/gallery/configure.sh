#!/bin/sh
# $Id: configure.sh,v 1.11 2004/06/09 21:48:15 cryptographite Exp $

chmod 755 setup

if [ ! -f config.php ]; then
    touch config.php
fi

if [ ! -f .htaccess ]; then
    touch .htaccess
fi

chmod 666 config.php .htaccess

echo ""
echo "You are now in setup mode. Your Gallery installation"
echo "can be configured by pointing your web browser"
echo "to the URL to 'setup' in this directory."
echo ""
