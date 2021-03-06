<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * auto controller works when the system cannot found match controller.
 * this controller will lookup uri and determine if it is category, article, page and call those controller to work.
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */
 
class auto_controller extends MY_Controller {
	
	
	function __construct() {
		parent::__construct();
	}// __construct
	
	
	function _remap() {
		$this->index();
	}// _remap
	
	
	function index() {
		$att = $this->uri->uri_string();
		$att1 = $this->uri->segment(1);
		$uri_arr = $this->uri->segment_array();
		$att2 = array();
		foreach ( $uri_arr as $item ) {
			if ( $item != $att1 ) {
				$att2[] = $item;
			}
		}
		unset( $uri_arr );
		// get real uri.
		if ( empty( $att2 ) ) {
			$last_urisegment = $att1;
		} else {
			$last_urisegment = $att2[count($att2)-1];
		}
		// lookup in url alias
		$this->db->where( 'uri_encoded', $last_urisegment );
		$this->db->where( 'language', $this->lang->get_current_lang() );
		$query = $this->db->get( 'url_alias' );
		if ( $query->num_rows() > 0 ) {
			$row = $query->row();
			$query->free_result();
			$c_type = $row->c_type;
			unset( $row );
			//
			if ( $c_type == 'category' ) {
				$this->load->module( 'category' );
				return $this->category->index( $att1, $att2 );
			} elseif ( $c_type == 'article' ) {
				$this->load->module( 'post' );
				return $this->post->view( $last_urisegment );
			} elseif ( $c_type == 'page' ) {
				$this->load->module( 'post' );
				return $this->post->view( $last_urisegment );
			}
		}
		$query->free_result();
		unset( $c_type, $query );
		// found nothing.
		show_404();
	}// index
	
	
}

// EOF