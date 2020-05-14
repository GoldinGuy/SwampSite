#!/bin/sh
# $Id: secure.sh,v 1.12 2004/06/10 15:08:16 jenst Exp $

if [ -f config.php ]; then
    chmod 644 config.php 
fi

if [ -f .htaccess ]; then
    chmod 644 .htaccess
fi

if [ -f setup/resetadmin ]; then
    rm -f setup/resetadmin
fi

echo ""
echo "Your Gallery is now secure and cannot be configured.  If"
echo "you wish to reconfigure it, run:"
echo ""
echo "    % ./configure.sh"
echo ""
