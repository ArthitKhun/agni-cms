<?php
/**
 * 
 * PHP version 5
 * 
 * @deprecated use modules_plug instead.
 * @package agni cms
 * @author Vheissu.
 * @link https://github.com/Vheissu/CI-Plugin-System
 * @author (adapted by) vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

#
#class plugins {
#	
#	
#	// actions
#	public static $actions;
#	public static $current_action;
#	public static $run_actions;
#	
#	public $ci;
#	public static $instance;
#	
#	// plugins actived
#	public static $plugins_active;
#	// plugin directory
#	public $plugin_dir;
#	
#	
#	function __construct() {
#		$this->ci =& get_instance();
#		$this->ci->config->load( 'agni' );
#		$this->plugin_dir = $this->ci->config->item( 'agni_plugins_path' );
#		// include activated plugins
#		$this->include_plugins();
#	}// __construct
#	
#	
#	/**
#	 * Action Exists
#	 *
#	 * Does a particular action hook even exist?
#	 * 
#	 * @param mixed $name
#	 */
#	public function action_exists( $name ) {
#		if ( isset( self::$actions[$name] ) ) {
#			return true;
#		} else {
#			return false;
#		}
#	}// action_exists
#	
#	
#	/**
#	 * add new hook trigger action
#	 * @param mixed $name
#	 * @param mixed $function
#	 * @param mixed $priority
#	 * @return mixed 
#	 */
#	function add_action( $name, $function, $priority=10 ) {
#		if ( isset( self::$actions[$name][$priority][$function] ) ) {
#			return true;
#		}
#		if ( is_array( $name ) ) {
#			// array action hook
#			foreach ( $name as $name ) {
#				self::$actions[$name][$priority][$function] = array( 'function' => $function );
#			}
#		} else {
#			// single action hook
#			self::$actions[$name][$priority][$function] = array( 'function' => $function );
#		}
#		return true;
#	}// add_action
#	
#	
#	/**
#	 * trigger an action for particular action hook
#	 * @param mixed $name
#	 * @param mixed $arguments
#	 * @return mixed 
#	 */
#	function do_action( $name, $arguments = '' ) {
#		// running action hook that not exists
#		if ( ! isset( self::$actions[$name] ) ) {
#			return $arguments;
#		}
#		// set current hook
#		self::$current_action = $name;
#		// sort action hook
#		ksort( self::$actions );
#		foreach(self::$actions[$name] AS $priority => $names) {
#			if ( is_array( $names ) ) {
#				foreach ( $names as $name ) {
#					// This line runs our function and stores the result in a variable     
#					$returnargs = call_user_func_array( $name['function'], array( &$arguments ) );
#					if ( $returnargs ) {
#						$arguments = $returnargs;
#					}
#					// Store our run hooks in the hooks history array
#					self::$run_actions[$name][$priority];
#				}
#			}
#		}
#		// No hook is running any more
#		self::$current_action = '';
#		return $arguments;
#	}// do_action
#	
#	
#	/**
#	 * include activated plugins.
#	 * @return type 
#	 */
#	function include_plugins() {
#		$query = $this->ci->db->get( 'plugins' );
#		if ( $query->num_rows() > 0 ) {
#			foreach ( $query->result() as $row ) {
#				if ( file_exists( $this->plugin_dir.$row->plugin_system_name.'/'.$row->plugin_system_name.'.php' ) ) {
#					include_once( $this->plugin_dir.$row->plugin_system_name.'/'.$row->plugin_system_name.'.php' );
#				}
#			}
#		}
#		$query->free_result();
#		return true;
#	}// include_plugins
#	
#	
#	/**
#	 * instance of this plugins
#	 * @return object 
#	 */
#	public static function instance() {
#		if ( ! self::$instance ) {
#			self::$instance = new plugins();
#		}
#		return self::$instance;
#	}// instance
#	
#	
#	/**
#	 * Remove Action
#	 *
#	 * Remove an action hook. No more needs to be said.
#	 * 
#	 * @param mixed $name
#	 * @param mixed $function
#	 * @param mixed $priority
#	 */
#	function remove_action( $name, $function, $priority=10 ) {
#		// If the action hook doesn't, just return true
#		if ( !isset( self::$actions[$name][$priority][$function] ) ) {
#			return true;
#		}
#		// Remove the action hook from our hooks array
#		unset( self::$actions[$name][$priority][$function] );
#	}// remove_action
#	
#	
#	function remove_all_action( $name, $priority = 10 ) {
#		if ( !isset( self::$actions[$name][$priority] ) ) {
#			return true;
#		}
#		// remove all hook from action
#		unset( self::$action[$name][$priority] );
#	}// remove_all_action
#	
#	
#}

# end of plugins class. below this line are plugins functions ###################################
/*
function action_exists( $name ) {
	return plugins::instance()->action_exists( $name );
}// action_exists


function add_action( $name, $function, $priority=10 ) {
	return plugins::instance()->add_action( $name, $function, $priority );
}// add_action


function do_action( $name, $arguments = '' ) {
	return plugins::instance()->do_action( $name, $arguments );
}// do_action


function remove_action( $name, $function, $priority=10 ) {
	return plugins::instance()->remove_action( $name, $function, $priority );
}// remove_action


function remove_all_action( $name, $priority = 10 ) {
	return plugins::instance()->remove_all_action( $name, $priority );
}// remove_all_action
*/