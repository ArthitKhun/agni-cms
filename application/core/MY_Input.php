<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

class MY_Input extends CI_Input {
	
	
	function __construct() {
		parent::__construct();
	}// __construct
	
	
	/**
	 * ip_address
	 * @return string 
	 */
	function  ip_address() {
		if ( $this->ip_address !== false ) {
			return $this->ip_address;
		}
		// IMPROVED!! CI ip address cannot detect through http_x_forwarded_for. this one can do.
		if (isset($_SERVER['HTTP_CLIENT_IP'])) {
			// //check ip from share internet
			$this->ip_address = $_SERVER['HTTP_CLIENT_IP'];
		} elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
			//to check ip is pass from proxy
			$this->ip_address = $_SERVER['HTTP_X_FORWARDED_FOR'];
		} else {
			$this->ip_address = $_SERVER['REMOTE_ADDR'];
		}
		//
		if ( $this->ip_address === false ) {
			$this->ip_address = "0.0.0.0";
			return $this->ip_address;
		}
		//
		if (strpos($this->ip_address, ',') !== FALSE)
		{
			$x = explode(',', $this->ip_address);
			$this->ip_address = trim(end($x));
		}
		//
		if ( ! $this->valid_ip($this->ip_address)){
			$this->ip_address = '0.0.0.0';
		}
		//
		return $this->ip_address;
	}
	
	
	/**
	 * Validate IP Address
	 *
	 * Updated version suggested by Geert De Deckere
	 * Add IPV6 validation
	 * @author DjLeChuck
	 * @link http://codeigniter.com/forums/viewthread/182457/
	 *
	 * @access    public
	 * @param    string
	 * @return    string
	 */
	function valid_ip($ip) {
		// Check if it's IPV4 or IPV6
		if (substr_count($ip, ':') > 0):
			// IPV6
			// RegExp from http://forums.dartware.com/viewtopic.php?t=452
			// MUST be in 1 line !
			define('IPV6_REGEX', "/^\s*((([0-9A-Fa-f]{1,4}:){7}(([0-9A-Fa-f]{1,4})|:))|(([0-9A-Fa-f]{1,4}:){6}(:|((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})|(:[0-9A-Fa-f]{1,4})))|(([0-9A-Fa-f]{1,4}:){5}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){4}(:[0-9A-Fa-f]{1,4}){0,1}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){3}(:[0-9A-Fa-f]{1,4}){0,2}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:){2}(:[0-9A-Fa-f]{1,4}){0,3}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(([0-9A-Fa-f]{1,4}:)(:[0-9A-Fa-f]{1,4}){0,4}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(:(:[0-9A-Fa-f]{1,4}){0,5}((:((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})?)|((:[0-9A-Fa-f]{1,4}){1,2})))|(((25[0-5]|2[0-4]\d|[01]?\d{1,2})(\.(25[0-5]|2[0-4]\d|[01]?\d{1,2})){3})))(%.+)?\s*$/");

			if (!preg_match(IPV6_REGEX, $ip)):
				return FALSE;
			endif;
		else:
			// IPV4
			$ip_segments = explode('.', $ip);

			// Always 4 segments needed
			if (count($ip_segments) != 4) {
				return FALSE;
			}
			// IP can not start with 0
			if ($ip_segments[0][0] == '0') {
				return FALSE;
			}
			// Check each segment
			foreach ($ip_segments as $segment) {
				// IP segments must be digits and can not be
				// longer than 3 digits or greater then 255
				if ($segment == '' OR preg_match("/[^0-9]/", $segment) OR $segment > 255 OR strlen($segment) > 3) {
					return FALSE;
				}
			}
		endif;

		return TRUE;
	}
	
	
}
