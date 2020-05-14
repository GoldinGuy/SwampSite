#!/usr/bin/perl -n
# $Id: transform_fuzzy.pl,v 1.2 2003/07/28 09:49:27 jefmcg Exp $
#
/^., fuzzy/ and $fuzzy = 1 and next;
/^$/ and $fuzzy = 0;
s/msgstr.*/msgstr ""/ if ($fuzzy);

print $_;

