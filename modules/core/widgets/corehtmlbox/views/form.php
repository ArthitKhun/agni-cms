<label><?php echo lang( 'block_title' ); ?>: <input type="text" name="block_title" value="<?php echo $values['block_title']; ?>" maxlength="255" /></label>
<label>
	<?php echo lang( 'coremd_htmlbox_html' ); ?>: 
	<textarea name="html" cols="30" rows="10"><?php if ( isset( $values['html'] ) ) {echo htmlspecialchars( $values['html'], ENT_QUOTES, config_item( 'charset' ) );} ?></textarea>
</label>