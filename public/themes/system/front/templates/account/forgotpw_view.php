<h1><?php echo lang( 'account_forget_userpass' ); ?></h1>

<p><?php echo lang( 'account_enter_email_link_you_account_to_reset' ); ?></p>

<?php echo form_open(); ?> 
	<?php if ( isset( $form_status ) ) {echo $form_status;} ?>
	
	<?php if ( !isset( $hide_form ) || ( isset( $hide_form ) && $hide_form == false ) ): ?> 
	
	<label class="form-label"><?php echo lang( 'account_email' ); ?>:<input type="email" name="account_email" value="<?php if ( isset( $account_email ) ) {echo $account_email;} ?>" maxlength="255" /></label>
	<?php if ( $plugin_captcha != null ) {
		echo $plugin_captcha;
	} else { ?>
	<label class="form-label captcha-field">
		<?php echo lang( 'account_captcha' ); ?>:<br />
		<img src="<?php echo $this->base_url; ?>public/images/securimage_show.php" alt="securimage" class="captcha" />
		<a href="#" onclick="$('.captcha').attr( 'src', '<?php echo $this->base_url; ?>public/images/securimage_show.php?' + Math.random() ); return false" tabindex="-1"><img src="<?php echo $this->base_url; ?>public/images/reload.gif" alt="" /></a>
		<input type="text" name="captcha" value="<?php if ( isset( $captcha ) ) {echo $captcha;} ?>" class="input-captcha" autocomplete="off" />
	</label>
	<?php } ?>
	<button type="submit" class="bb-button"><?php echo lang( 'account_send' ); ?></button>
	
	<?php endif; ?> 
	
<?php echo form_close(); ?> 