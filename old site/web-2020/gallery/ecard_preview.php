<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2005 Bharat Mediratta
 *
 * This file Copyright (C) 2003-2004 Joan McGalliard
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA  02110-1301, USA.
 *
 * $Id: ecard_preview.php,v 1.1.2.1 2005/09/12 22:40:44 dmolavi Exp $
 */
?>
<?php
/*
###################################################################
# IBPS E-C@ard for Gallery           Version 1                    #
# Copyright 2002 IBPS Friedrichs     info@ibps-friedrichs.de      #
# Ported for Gallery By freenik      webmaster@cittadipolicoro.com#
###################################################################
*/
?>
<?php

require_once(dirname(__FILE__) . '/init.php');

$ecard = getRequestVar('ecard');

list($error,$ecard_data_to_parse) = get_ecard_template($ecard["template_name"]);

if (!empty($error)) {
    header("Location: " . makeGalleryHeaderUrl("includes/ecard/_templates/error.htm"));
} else {
    echo parse_ecard_template($ecard,$ecard_data_to_parse);
}

?>
