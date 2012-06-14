<?php
/**
 * 
 * PHP version 5
 * 
 * @package agni cms
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

function config_load( $cfg_name = '', $return_field = 'config_value' ) {
	$CI =& get_instance();
	$CI->load->model( 'config_model' );
	return $CI->config_model->load_single( $cfg_name, $return_field );
}// config_load