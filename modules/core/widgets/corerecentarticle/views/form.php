<label><?php echo lang( 'block_title' ); ?>: <input type="text" name="block_title" value="<?php echo $values['block_title']; ?>" maxlength="255" /></label>
<label>
	<?php echo lang( 'coremd_recentarticle_number' ); ?>:
	<input type="number" name="recent_num" value="<?php if ( isset( $values['recent_num'] ) ) {echo $values['recent_num'];} ?>" maxlength="2" />
</label>