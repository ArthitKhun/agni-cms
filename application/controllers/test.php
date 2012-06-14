<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * test controller
 * demonstrate how to use different theme.
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

class test extends MY_Controller {

	
	function __construct() {
		parent::__construct();
	}// __construct
	
	
	function index() {
		show_404();// should enable this function in production site for not showing test page to public.
		$this->theme_path = base_url().config_item( 'agni_theme_path' ).'test/';// ค่านี้ ถ้าไม่เซ็ค ระบบจะโหลดจาก theme หลักมาแทน โดยเฉพาะ css จะโหลดจาก theme หลัก
		//$this->theme_system_name = 'test';// ค่านี้ ถ้าไม่เซ็ต ระบบจะโหลดจาก theme หลักมาแทน, ถ้าเซ็ต ก็ไม่จำเป็นต้องเซ็ตตรง generate_page ก็ได้
		
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title( 'test' );
		// meta tags
		// link tags
		// script tags
		// end head tags output ##############################
		// output
		$this->generate_page( 'front/templates/test_view', $output, 'test' );
	}// index
	

}

