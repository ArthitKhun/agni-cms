<?php
/**
 * 
 * PHP version 5
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 * _uninstall is fixed suffix name of module for use in auto uninstall
 * this auto uninstall will run silently.
 * 
 */

class blog_uninstall extends admin_controller {
	
	
	public $module_system_name = 'blog';

	
	function __construct() {
		parent::__construct();
	}
	
	
	function index() {
		// uninstall module
		if ( $this->db->table_exists( 'blog' ) ) {
			$sql = 'DROP TABLE `'.$this->db->dbprefix('blog').'`;';
			$this->db->query( $sql );
		}
		$this->db->set( 'module_install', '0' );
		$this->db->where( 'module_system_name', $this->module_system_name );
		$this->db->update( 'modules' );
		echo 'Uninstall completed. <a href="#" onclick="window.history.go(-1);">Go back</a>';
	}
	

}

