<?php

/**
 * recursive_array_search
 * @author buddel
 * @link http://www.php.net/manual/en/function.array-search.php#91365
 * @param string $needle
 * @param array $haystack
 * @return array 
 */
function recursive_array_search($needle, $haystack) {
	foreach ($haystack as $key => $value) {
		$current_key = $key;
		if ($needle === $value OR (is_array($value) && recursive_array_search($needle, $value) !== false)) {
			return $current_key;
		}
	}
	return false;
}// recursive_array_search