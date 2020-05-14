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
 * $Id: AdminUser.php,v 1.3.2.1 2005/09/12 22:40:45 dmolavi Exp $
 */
?>
<?php
class CPGNuke_AdminUser extends Abstract_User {
	var $db;
	var $prefix;

	function CPGNuke_AdminUser($admin) {
		global $gallery;
		global $CLASS;
		
		$admin_info = $CLASS['member']->admin;

		$this->db = $gallery->database{"cpgnuke"};
		$this->prefix = $gallery->database{"prefix"};

		$this->username = $admin_info['aid'];
		$this->fullname = $admin_info['aid'];
		$this->email = $admin_info['email'];
		$this->isAdmin = 1;
		$this->canCreateAlbums = 1;
		$this->uid = "admin_". $admin_info['aid'];
	}
}

?>
