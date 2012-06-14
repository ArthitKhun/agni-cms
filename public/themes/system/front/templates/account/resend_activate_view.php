<h1><?php echo lang( 'account_resend_verify_email' ); ?></h1>

<?php echo form_open(); ?> 
	<?php if ( isset( $form_status ) ) {echo $form_status;} ?>
	
	<label class="form-label"><?php echo lang( 'account_email' ); ?>:<input type="email" name="account_email" value="<?php if ( isset( $account_email ) ) {echo $account_email;} ?>" maxlength="255" /></label>
	<button type="submit" class="bb-button"><?php echo lang( 'account_send' ); ?></button>
	
<?php echo form_close(); ?> 