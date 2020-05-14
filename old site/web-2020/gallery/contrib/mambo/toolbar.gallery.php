<?php
/*
 * Gallery - a web based photo album viewer and editor
 * Copyright (C) 2000-2005 Bharat Mediratta
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
 * Gallery Component for Mambo Open Source CMS v4.5 or newer
 * Original author: Beckett Madden-Woods <beckett@beckettmw.com>
 *
 * $Id: toolbar.gallery.php,v 1.2.2.1 2005/09/12 22:40:46 dmolavi Exp $
 */

require_once($mainframe->getPath('toolbar_default'));

mosMenuBar::startTable();
mosMenuBar::save();
mosMenuBar::back();
mosMenuBar::spacer();
mosMenuBar::endTable();

?>
