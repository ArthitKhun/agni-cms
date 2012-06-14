<label><?php echo lang( 'block_title' ); ?>: <input type="text" name="block_title" value="<?php echo $values['block_title']; ?>" maxlength="255" /></label>
<label><?php echo lang( 'coremd_link_menu' ); ?>: 
	<?php $this->load->model( 'menu_model' );?> 
	<select name="mg_id">
		<option value=""></option>
		<?php
		$list_mg = $this->menu_model->list_group( false );
		if ( is_array( $list_mg['items'] ) ) {
			foreach ( $list_mg['items'] as $row ) {
				echo '<option value="'.$row->mg_id.'"'.( isset( $values['mg_id'] ) && $values['mg_id'] == $row->mg_id ? ' selected="selected"' : '' ).'>'.$row->mg_name.'</option>';
			}
		}
		?>
	</select>
</label>