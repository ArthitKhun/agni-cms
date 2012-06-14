<h1><?php echo lang( 'account_reset_password' ); ?></h1>

<?php if ( isset( $form_status ) ) {echo $form_status;} ?>

<?php if ( isset( $show_changepw_form ) && $show_changepw_form === true ): ?> 
<?php echo form_open(); ?> 
	<label class="form-label"><?php echo lang( 'account_new_password' ); ?>:<span class="txt_require">*</span> <input type="password" name="new_password" value="" /></label>
	<label class="form-label"><?php echo lang( 'account_confirm_new_password' ); ?>:<span class="txt_require">*</span> <input type="password" name="conf_new_password" value="" /></label>
	<button type="submit" class="bb-button"><?php echo lang( 'account_change_password' ); ?></button>
<?php echo form_close(); ?> 
<?php endif; ?> 