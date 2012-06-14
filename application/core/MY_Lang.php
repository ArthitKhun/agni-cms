<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 
 * PHP version 5
 * 
 * @author vee w.
 * @license http://www.opensource.org/licenses/GPL-3.0
 *
 */

class MY_Lang extends MX_Lang {
	
	
	function __construct() {
		parent::__construct();
		
		/**
		 * @name multi language by url
		 * @author wiredesignz
		 * @copyright     Copyright (c) 2011 Wiredesignz
		 * @version         0.29
		 * @link http://codeigniter.com/wiki/URI_Language_Identifier/
		 * @uses http://domain.tld/en/controller/method, http://domain.tld/es/controller/method
		 */
		global $URI, $CFG, $IN;
		$config = & $CFG->config;
		$index_page = $config['index_page'];
		$lang_ignore = $config['lang_ignore'];
		$default_abbr = $config['language_abbr'];
		$lang_uri_abbr = $config['lang_uri_abbr'];
		/* get the language abbreviation from uri */
		$uri_abbr = $URI->segment(1);
		/* adjust the uri string leading slash */
		$URI->uri_string = preg_replace("|^\/?|", '/', $URI->uri_string);
		if ($lang_ignore) {
			if (isset($lang_uri_abbr[$uri_abbr])) {
				/* set the language_abbreviation cookie */
				$IN->set_cookie('user_lang', $uri_abbr, $config['sess_expiration']);
			} else {
				/* get the language_abbreviation from cookie */
				$lang_abbr = $IN->cookie($config['cookie_prefix'] . 'user_lang');
			}
			if (strlen($uri_abbr) == 2) {
				/* reset the uri identifier */
				$index_page .= empty($index_page) ? '' : '/';
				/* remove the invalid abbreviation */
				$URI->uri_string = preg_replace("|^\/?$uri_abbr\/?|", '', $URI->uri_string);
				/* redirect */
				header('Location: ' . $config['base_url'] . $index_page . $URI->uri_string);
				exit;
			}
		} else {
			/* set the language abbreviation */
			$lang_abbr = $uri_abbr;
		}
		/* check validity against config array */
		if (isset($lang_uri_abbr[$lang_abbr])) {
			/**
			 * add if (!$lan_ignore) to fix $this->uri->segment(n);
			 * @author vee w.
			 */
			if ( !$lang_ignore ) {
				/* reset uri segments and uri string */
				$URI->_reindex_segments(array_shift($URI->segments));
			}
			$URI->uri_string = preg_replace("|^\/?$lang_abbr|", '', $URI->uri_string);
			/* set config language values to match the user language */
			$config['language'] = $lang_uri_abbr[$lang_abbr];
			$config['language_abbr'] = $lang_abbr;
			/* if abbreviation is not ignored */
			if (!$lang_ignore) {
				/**
				 * hide lang abbr in url if ignore default is true and lang abbr = default abbr
				 * @author vee w. 
				 */
				if ( $config['lang_ignore_default'] == false || ($config['lang_ignore_default'] == true && $lang_abbr != $default_abbr) ) {
					/* check and set the uri identifier */
					$index_page .= empty($index_page) ? $lang_abbr : "/$lang_abbr";
					/* reset the index_page value */
					$config['index_page'] = $index_page;
				}
			}
			/* set the language_abbreviation cookie */
			$IN->set_cookie('user_lang', $lang_abbr, $config['sess_expiration']);
		} else {
			/* if abbreviation is not ignored */
			if (!$lang_ignore) {
				/**
				 * hide lang abbr in url if ignore default is true and lang abbr = default abbr
				 * @author vee w. 
				 */
				if ( $config['lang_ignore_default'] == false ) {
					/* check and set the uri identifier to the default value */
					$index_page .= empty($index_page) ? $default_abbr : "/$default_abbr";
					if (strlen($lang_abbr) == 2) {
						/* remove invalid abbreviation */
						$URI->uri_string = preg_replace("|^\/?$lang_abbr|", '', $URI->uri_string);
					}
					/* redirect */
					header('Location: ' . $config['base_url'] . $index_page . $URI->uri_string);
					exit;
				}
			}
			/* set the language_abbreviation cookie */
			$IN->set_cookie('user_lang', $default_abbr, $config['sess_expiration']);
		}
		log_message('debug', "Language_Identifier Class Initialized");
	}// __construct
	
	
	/**
	 * get current language
	 * @author vee w.
	 * @global object $CFG
	 * @param boolean $return_abbr
	 * @return string 
	 */
	function get_current_lang( $return_abbr = true ) {
		global $CFG;
		$config = & $CFG->config;
		$lang_uri_abbr = $config['lang_uri_abbr'];
		if ( $return_abbr ) {
			return array_search( $config['language'], $lang_uri_abbr );
		} else {
			return $config['language'];
		}
	}// get_current_lang
	
	
	/**
	 * line
	 * @param string $line
	 * @return string 
	 */
	function line($line = '') {
		$linetr = ($line == '' OR ! isset($this->language[$line])) ? FALSE : $this->language[$line];

		// Because killer robots like unicorns!
		if ($linetr === FALSE)
		{
			log_message('error', 'Could not find the language line "'.$line.'"');
			$linetr = $line;
		}

		return $linetr;
	}// line
	
	
}
