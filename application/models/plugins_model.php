<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
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

#class plugins_model extends CI_Model {
#	
#	
#	private $plugin_dir;
#
#	
#	function __construct() {
#		parent::__construct();
#		$this->_set_plugin_dir();
#	}// __construct
#	
#	
#	/**
#	 * set plugin_dir property.
#	 */
#	function _set_plugin_dir() {
#		if ( !property_exists( $this, 'plugins' ) ) {
#			$this->load->library( 'plugins' );
#			$this->plugin_dir = $this->plugins->plugin_dir;
#		} else {
#			$this->plugin_dir = $this->plugins->plugin_dir;
#		}
#	}// _set_plugin_dir
#	
#	
#	/**
#	 * add plugin
#	 * @return mixed 
#	 */
#	function add_plugin() {
#		// load agni config
#		$this->config->load( 'agni' );
#		// config upload
#		$config['upload_path'] = $this->config->item( 'agni_upload_path' ).'unzip';
#		$config['allowed_types'] = 'zip';
#		$config['encrypt_name'] = true;
#		$this->load->library( 'upload', $config );
#		if ( ! $this->upload->do_upload( 'plugin_file' ) ) {
#			return $this->upload->display_errors( '<div>', '</div>' );
#		} else {
#			$data = $this->upload->data();
#		}
#		// trying to extract ZIP
#		if ( isset( $data ) && is_array( $data ) && !empty( $data ) ) {
#			require_once( APPPATH.'/libraries/dunzip/dUnzip2.inc.php' );
#			$zip = new dUnzip2( $data['full_path'] );
#			$zip->debug = false;
#			// check inside zip that it is plugin directory.
#			$list = $zip->getList();
#			$valid_plugin = true;
#			$i = 1;
#			foreach ( $list as $file_name => $zipped ) {
#				if ( $i == 1 ) {
#					$plugin_dir = str_replace( '/', '', $file_name );
#				}
#				if ( $i == 1 && ( $zipped['compression_method'] != '0' || $zipped['compressed_size'] != '0' || $zipped['uncompressed_size'] != '0' ) ) {
#					// first item is not directory.
#					$valid_plugin = false;
#				}
#				$i++;
#				if ( $i >= 2 ) {continue;}
#			}
#			// plugin required file is not exists = invalid plugin file (plugin_name/plugin_name.php)
#			if ( !isset( $list[$plugin_dir.'/'.$plugin_dir.'.php'] ) ) {
#				$valid_plugin = false;
#			}
#			// valid plugin or not
#			if ( $valid_plugin == false ) {
#				$zip->__destroy();
#				if ( file_exists( $data['full_path'] ) ) {
#					unlink( $data['full_path'] );
#				}
#				unset( $i, $valid_plugin, $list, $zip );
#				return $this->lang->line( 'plugins_wrong_structure' );
#			} else {
#				// unzip
#				$zip->unzipall($config['upload_path']);
#				$zip->__destroy();
#				// remove zip file
#				if ( file_exists( $data['full_path'] ) ) {
#					unlink( $data['full_path'] );
#				}
#				// move to plugin dir
#				$this->load->helper( 'file' );
#				smartCopy( dirname(BASEPATH).'/'.$config['upload_path'].'/'.$plugin_dir, dirname(BASEPATH).'/'.$this->plugin_dir.$plugin_dir );
#				// delete everything in upload plugin/
#				delete_files( $config['upload_path'].'/'.$plugin_dir, true );
#				// delete plugin/
#				rmdir( $config['upload_path'].'/'.$plugin_dir );
#				// plugin action install
#				$this->modules_plug->do_action( 'plugin_install_'.$plugin_dir );
#				return true;
#			}
#		}
#	}// add_plugin
#	
#	
#	/**
#	 * delete a single plugin
#	 * @param string $id
#	 * @return boolean 
#	 */
#	function delete_a_plugin( $id ) {
#		// look up in db if activated -> cannot delete.
#		$this->db->where( 'plugin_system_name', $id );
#		if ( $this->db->count_all_results( 'plugins' ) > 0 ) {return false;}
#		// uninstall plugin action
#		$this->modules_plug->do_action( 'plugin_uninstall_'.$id );
#		// delete cache
#		$this->config_model->delete_cache( 'isplugactive_' );
#		// load file helper for delete folder recursive
#		$this->load->helper( 'file' );
#		if ( delete_files( $this->plugin_dir.$id.'/', true ) == true ) {
#			if ( is_dir( $this->plugin_dir.$id ) )
#				@rmdir( $this->plugin_dir.$id );
#			return true;
#		}
#		return false;
#	}// delete_a_plugin
#	
#	
#	/**
#	 * activate plugin
#	 * @param string $plugin
#	 * @return boolean
#	 */
#	function do_activate( $plugin = '' ) {
#		$pdata = $this->read_plugin_metadata( $plugin.'/'.$plugin.'.php'  );
#		// check if plugin activated
#		$this->db->where( 'plugin_system_name', $plugin );
#		if ( $this->db->count_all_results( 'plugins' ) > 0 ) {return true;}
#		//
#		$this->db->trans_start();
#		$this->db->set( 'plugin_system_name', $plugin );
#		$this->db->set( 'plugin_name', ( empty($pdata['name']) ? $plugin : $pdata['name'] ) );
#		$this->db->set( 'plugin_url', ( !empty($pdata['url']) ? $pdata['url'] : null ) );
#		$this->db->set( 'plugin_version', ( !empty($pdata['version']) ? $pdata['version'] : null ) );
#		$this->db->set( 'plugin_description', ( !empty($pdata['description']) ? $pdata['description'] : null ) );
#		$this->db->set( 'plugin_author', ( !empty($pdata['author_name']) ? $pdata['author_name'] : null ) );
#		$this->db->set( 'plugin_author_url', ( !empty($pdata['author_url']) ? $pdata['author_url'] : null ) );
#		$this->db->insert( 'plugins' );
#		$this->db->trans_complete();
#		// check transaction
#		if ( $this->db->trans_status() === false ) {
#			$this->db->trans_rollback();
#			return false;
#		}
#		// delete cache
#		$this->config_model->delete_cache( 'isplugactive_' );
#		$this->plugins->include_plugins();
#		// activate plugin self
#		$this->modules_plug->do_action( 'plugin_activate_'.$plugin );
#		return true;
#	}// do_activate
#	
#	
#	/**
#	 * deactivate plugin
#	 * @param string $plugin
#	 * @return boolean
#	 */
#	function do_deactivate( $plugin = '' ) {
#		$this->db->trans_start();
#		$this->db->where( 'plugin_system_name', $plugin );
#		$this->db->delete( 'plugins' );
#		$this->db->trans_complete();
#		// check transaction
#		if ( $this->db->trans_status() === false ) {
#			$this->db->trans_rollback();
#			return false;
#		}
#		// delete cache
#		$this->config_model->delete_cache( 'isplugactive_' );
#		// deactivate plugin self
#		$this->modules_plug->do_action( 'plugin_deactivate_'.$plugin );
#		return true;
#	}// do_deactivate
#	
#	
#	/**
#	 * is_activated
#	 * @param string $plugin_system_name
#	 * @return boolean 
#	 */
#	function is_activated( $plugin_system_name = '' ) {
#		if ( $plugin_system_name == null ) {return false;}
#		// load cache driver
#		$this->load->driver( 'cache', array( 'adapter' => 'file' ) );
#		// check cached
#		if ( false === $isplug_active = $this->cache->get( 'isplugactive_'.$plugin_system_name ) ) {
#			$this->db->where( 'plugin_system_name', $plugin_system_name );
#			if ( $this->db->count_all_results( 'plugins' ) > 0 ) {
#				$this->cache->save( 'isplugactive_'.$plugin_system_name, 'true', 2678400 );
#				return true;
#			}
#			$this->cache->save( 'isplugactive_'.$plugin_system_name, 'false', 2678400 );
#			return false;
#		}
#		// return cached
#		if ( $isplug_active == 'true' ) {
#			return true;
#		} else {
#			return false;
#		}
#	}// is_activated
#	
#	
#	/**
#	 * ลิสต์รายการ plugin
#	 * @return array 
#	 */
#	function list_plugins( ) {
#		$dir = $this->scan_plugin_dir();
#		if ( is_array( $dir ) )
#			$pages = array_chunk( $dir, 20 );
#		// pagination
#		$pgkey = (int)$this->input->get( 'per_page' );
#		if ( $pgkey > 0 ) {$pgkey = ($pgkey-1);}
#		// pagination-----------------------------
#		$this->load->library( 'pagination' );
#		$config['base_url'] = site_url( $this->uri->uri_string() ).'?';
#		$config['total_rows'] = count($dir);
#		$config['per_page'] = 20;
#		$config['num_links'] = 5;
#		$config['use_page_numbers'] = true;
#		$config['page_query_string'] = true;
#		$config['full_tag_open'] = '<div class="pagination">';
#		$config['full_tag_close'] = "</div>\n";
#		$config['first_tag_close'] = '';
#		$config['last_tag_open'] = '';
#		$config['first_link'] = '|&lt;';
#		$config['last_link'] = '&gt;|';
#		$this->pagination->initialize( $config);
#		//you may need this in view if you call this in controller or model --> $this->pagination->create_links();
#		// end pagination-----------------------------
#		//
#		$output['total'] = count($dir);
#		if ( is_array( $dir ) ) {
#			$output['items'] = $pages[$pgkey];
#		} else {
#			$output['items'] = null;
#		}
#		//$output['pagination'] = $pagination;
#		return $output;
#	}// list_plugins
#	
#	
#	/**
#	 * read plugin metadata
#	 * @param string $plugin_item
#	 * @return array 
#	 */
#	function read_plugin_metadata( $plugin_item = '' ) {
#		if ( empty( $plugin_item ) ) {return null;}
#		// load helper
#		$this->load->helper( 'file' );
#		// get plugin info.
#		$p_data = read_file( $this->plugin_dir.$plugin_item );
#		preg_match ( '|Plugin Name:(.*)$|mi', $p_data, $name );
#		preg_match ( '|Plugin URL:(.*)$|mi', $p_data, $url );
#		preg_match ( '|Version:(.*)|i', $p_data, $version );
#		preg_match ( '|Description:(.*)$|mi', $p_data, $description );
#		preg_match ( '|Author:(.*)$|mi', $p_data, $author_name );
#		preg_match ( '|Author URL:(.*)$|mi', $p_data, $author_url );
#		$output['name'] = ( isset( $name[1] ) ? trim($name[1]) : '' );
#		$output['url'] = ( isset( $url[1] ) ? trim($url[1]) : '' );
#		$output['version'] = ( isset( $version[1] ) ? trim($version[1]) : '' );
#		$output['description'] = ( isset( $description[1] ) ? trim($description[1]) : '' );
#		$output['author_name'] = ( isset( $author_name[1] ) ? trim($author_name[1]) : '' );
#		$output['author_url'] = ( isset( $author_url[1] ) ? trim($author_url[1]) : '' );
#		unset( $p_data, $name, $url, $version, $description, $author_name, $author_url );
#		return $output;
#	}// read_plugin_metadata
#	
#	
#	/**
#	 * สแกน directory ของ plugins
#	 * @return mixed 
#	 */
#	function scan_plugin_dir() {
#		$map = scandir( $this->plugin_dir );
#		if ( is_array( $map ) && !empty( $map ) ) {
#			// sort
#			natsort( $map );
#			// prepare
#			$dir = null;
#			$i = 0;
#			foreach ( $map as $key => $item ) {
#				if ( $item != '.' && $item != '..' && $item != 'index.html' && strpos( $item, ' ' ) === false ) {
#					if ( preg_match( "/[^a-zA-Z0-9_]/", $item ) ) {continue;}
#					if ( is_dir( $this->plugin_dir.$item ) && file_exists( $this->plugin_dir.$item.'/'.$item.'.php' ) ) {
#						$dir[$i]['plugin_system_name'] = $item;
#						$pdata = $this->read_plugin_metadata( $item.'/'.$item.'.php' );
#						$dir[$i]['plugin_name'] = $pdata['name'];
#						$dir[$i]['plugin_url'] = $pdata['url'];
#						$dir[$i]['plugin_version'] = $pdata['version'];
#						$dir[$i]['plugin_description'] = $pdata['description'];
#						$dir[$i]['plugin_author_name'] = $pdata['author_name'];
#						$dir[$i]['plugin_author_url'] = $pdata['author_url'];
#						unset( $pdata );
#						// check if activated
#						$dir[$i]['plugin_activated'] = $this->is_activated( $item );
#						unset( $result );
#					}
#					$i++;
#				}
#			}
#			return $dir;
#		}
#	}// scan_plugin_dir
#	
#
#}

