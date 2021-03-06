#!/bin/sh
# $Id: create_po_template.sh,v 1.9.16.1 2005/08/08 20:35:57 jenst Exp $
#
#note: requires xgettext version 0.12.1 or greater
#
#Note: for version 1.4.2, to support email internationalisation, need to 
#add keyword i18n to xgettext call


##### CORE .pot ############
cat copyright-header.txt > gallery-core.pot

xgettext --files-from=filelist-core -LPHP --keyword=_ --no-wrap --msgid-bugs-address="gallery-translations@lists.sourceforge.net" -o - | tail +7 >> gallery-core.pot

##### CONFIG .pot
cat copyright-header.txt > gallery-config.pot

xgettext --files-from=filelist-config -LPHP --keyword=_ --no-wrap --msgid-bugs-address="gallery-translations@lists.sourceforge.net" -o - | tail +7 >> gallery-config.pot
