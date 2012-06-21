<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * @deprecated use modules instead
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

class plugin extends admin_controller {

	
/*	function __construct() {
		parent::__construct();
		// load model
		$this->load->model( array( 'plugins_model' ) );
		// load helper
		$this->load->helper( array( 'form' ) );
		// load lang
		$this->lang->load( 'plugins' );
	}// __construct
	
	
	function _define_permission() {
		return array( 'plugins_manage_perm' => array( 'plugins_manage_perm', 'plugins_add_perm', 'plugins_activate_deactivate_perm', 'plugins_delete_perm', 'plugins_setting_perm' ) );
	}// _define_permission
	
	
	function activate() {
		// check permission
		if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_activate_deactivate_perm' ) != true ) {redirect( 'site-admin' );}
		// get plugin sys name
		$plugin_system_name = trim( $this->input->get( 'id' ) );
		$result = $this->plugins_model->do_activate( $plugin_system_name );
		// load session
		$this->load->library( 'session' );
		if ( $result == true ) {
			$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_activated' ).'</div>' );
		} else {
			$this->session->set_flashdata( 'form_status', '<div class="txt_error">'.lang( 'plugins_activated_fail' ).'</div>' );
		}
		redirect( 'site-admin/plugin' );
	}// activate
	
	
	function add() {
		// check permission
		if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_add_perm' ) != true ) {redirect( 'site-admin' );}
		// save action.
		if ( $this->input->post() ) {
			$result = $this->plugins_model->add_plugin();
			if ( $result === true ) {
				// load session
				$this->load->library( 'session' );
				$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_added' ).'</div>' );
				redirect( 'site-admin/plugin' );
			} else {
				$output['form_status'] = '<div class="txt_error">'.$result.'</div>';
			}
		}
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title( $this->lang->line( 'plugins_manager' ) );
		// meta tags
		// link tags
		$link = array(
			'<link rel="stylesheet" type="text/css" href="'.$this->base_url.'public/css-fw/beauty-buttons/beauty-buttons.css" media="all" />',
			);
		$output['page_link'] = $this->html_model->gen_tags( $link );
		unset( $link );
		// script tags
		// end head tags output ##############################
		$this->generate_page( 'site-admin/templates/plugins/plugins_add_view', $output );
	}
	
	
	function deactivate() {
		// check permission
		if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_activate_deactivate_perm' ) != true ) {redirect( 'site-admin' );}
		// get plugin sys name
		$plugin_system_name = trim( $this->input->get( 'id' ) );
		$result = $this->plugins_model->do_deactivate( $plugin_system_name );
		// load session
		$this->load->library( 'session' );
		if ( $result == true ) {
			$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_deactivated' ).'</div>' );
		} else {
			$this->session->set_flashdata( 'form_status', '<div class="txt_error">'.lang( 'plugins_deactivated_fail' ).'</div>' );
		}
		redirect( 'site-admin/plugin' );
	}// deactivate
	
	
	function delete() {
		// check permission
		if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_delete_perm' ) != true ) {redirect( 'site-admin' );}
		// get plugin sys name
		$plugin_system_name = trim( $this->input->get( 'id' ) );
		$result = $this->plugins_model->delete_a_plugin( $plugin_system_name );
		// load session
		$this->load->library( 'session' );
		if ( $result == true ) {
			$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_deleted' ).'</div>' );
		} else {
			$this->session->set_flashdata( 'form_status', '<div class="txt_error">'.lang( 'plugins_delete_fail' ).'</div>' );
		}
		redirect( 'site-admin/plugin' );
	}// delete
	
	
	function index() {
		// check permission
		if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_manage_perm' ) != true ) {redirect( 'site-admin' );}
		// load session for show last flashed session
		$this->load->library( 'session' );
		$form_status = $this->session->flashdata( 'form_status' );
		if ( $form_status != null ) {
			$output['form_status'] = $form_status;
		}
		unset( $form_status );
		// list plugins
		$output['list_item'] = $this->plugins_model->list_plugins();
		if ( is_array( $output['list_item'] ) ) {
			$output['pagination'] = $this->pagination->create_links();
		}
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title( $this->lang->line( 'plugins_manager' ) );
		// meta tags
		// link tags
		$link = array(
			'<link rel="stylesheet" type="text/css" href="'.$this->base_url.'public/css-fw/beauty-buttons/beauty-buttons.css" media="all" />',
			);
		$output['page_link'] = $this->html_model->gen_tags( $link );
		unset( $link );
		// script tags
		// end head tags output ##############################
		$this->generate_page( 'site-admin/templates/plugins/plugins_view', $output );
	}// index
	
	
	function process_bulk() {
		$id = $this->input->post( 'id' );
		if ( !is_array( $id ) ) {redirect( 'site-admin/plugin' );}
		$act = trim( $this->input->post( 'act' ) );
		// load library
		$this->load->library( 'session' );
		if ( $act == 'activate' ) {
			// check permission
			if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_activate_perm' ) != true ) {redirect( 'site-admin' );}
			foreach ( $id as $an_id ) {
				$result = $this->plugins_model->do_activate( $an_id );
				if ( $result === false ) {
					$fail_activate = true;
				}
			}
			if ( isset( $fail_activate ) && $fail_activate == true ) {
				$this->session->set_flashdata( 'form_status', '<div class="txt_error">'.lang( 'plugins_activated_fail_some' ).'</div>' );
			} else {
				$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_activated' ).'</div>' );
			}
			unset( $fail_activate, $result );
		} elseif ( $act == 'deactivate' ) {
			// check permission
			if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_deactivate_perm' ) != true ) {redirect( 'site-admin' );}
			foreach ( $id as $an_id ) {
				$result = $this->plugins_model->do_deactivate( $an_id );
				if ( $result === false ) {
					$fail_deactivate = true;
				}
			}
			if ( isset( $fail_activate ) && $fail_activate == true ) {
				$this->session->set_flashdata( 'form_status', '<div class="txt_error">'.lang( 'plugins_deactivated_fail_some' ).'</div>' );
			} else {
				$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_deactivated' ).'</div>' );
			}
			unset( $fail_deactivate, $result );
		} elseif ( $act == 'del' ) {
			// check permission
			if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_delete_perm' ) != true ) {redirect( 'site-admin' );}
			$delete_fail = false;
			foreach ( $id as $an_id ) {
				$result = $this->plugins_model->delete_a_plugin( $an_id );
				if ( $result === false ) {
					$delete_fail = true;
				}
			}
			if ( $delete_fail == true ) {
				$this->session->set_flashdata( 'form_status', '<div class="txt_error">'.lang( 'plugins_delete_fail_some' ).'</div>' );
			} else {
				$this->session->set_flashdata( 'form_status', '<div class="txt_success">'.lang( 'plugins_deleted' ).'</div>' );
			}
			unset( $delete_fail, $result );
		}
		// go back
		redirect( 'site-admin/plugin' );
	}// process_bulk
	
	
	function settings( $plugin_name = '' ) {
		// check permission
		if ( $this->account_model->check_admin_permission( 'plugins_manage_perm', 'plugins_setting_perm' ) != true ) {redirect( 'site-admin' );}
		// head tags output ##############################
		$output['page_title'] = $this->html_model->gen_title( $this->lang->line( 'plugins_manager' ) );
		// meta tags
		// link tags
		$link = array(
			'<link rel="stylesheet" type="text/css" href="'.$this->base_url.'public/css-fw/beauty-buttons/beauty-buttons.css" media="all" />',
			);
		$output['page_link'] = $this->html_model->gen_tags( $link );
		unset( $link );
		// script tags
		// end head tags output ##############################
		$output['page_content'] = $this->modules_plug->do_action( 'plugin_settings_'.$plugin_name );
		$this->load->view( 'site-admin/templates/template', $output );
	}// settings
	
*/
}

