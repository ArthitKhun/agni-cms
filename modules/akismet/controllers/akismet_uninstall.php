<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */
 
class akismet_uninstall extends admin_controller {
	
	
	public $module_system_name = 'akismet';
	
	
	function __construct() {
		parent::__construct();
	}// __construct
	
	
	function index() {
		// delete config name
		$this->db->where( 'config_name', 'akismet_api' );
		$this->db->delete( 'config' );
		// update modules install to 0
		$this->db->set( 'module_install', '0' );
		$this->db->where( 'module_system_name', $this->module_system_name );
		$this->db->update( 'modules' );
		// disable too
		$this->load->model( 'modules_model' );
		$this->modules_model->do_deactivate( $this->module_system_name );
		echo 'Uninstall completed. <a href="#" onclick="window.history.go(-1);">Go back</a>';
	}// index
	
	
}

// EOF