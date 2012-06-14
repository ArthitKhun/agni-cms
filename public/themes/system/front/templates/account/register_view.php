<h1><?php echo lang( 'account_register' ); ?></h1>

<?php echo form_open(); ?> 
	<div class="form-status-placeholder"><?php if ( isset( $form_status ) ) {echo $form_status;} ?></div>
	
	<?php if ( !isset( $hide_register_form ) || ( isset( $hide_register_form ) && $hide_register_form == false ) ): ?> 
	<div class="page-account-register">
		<label class="form-label"><?php echo lang( 'account_username' ); ?>: <span class="txt_require">*</span><input type="text" name="account_username" value="<?php if ( isset( $account_username ) ) {echo $account_username;} ?>" maxlength="255" /></label>
		<label class="form-label"><?php echo lang( 'account_email' ); ?>: <span class="txt_require">*</span><input type="email" name="account_email" value="<?php if ( isset( $account_email ) ) {echo $account_email;} ?>" maxlength="255" /></label>
		<label class="form-label"><?php echo lang( 'account_password' ); ?>: <span class="txt_require">*</span><input type="password" name="account_password" value="" maxlength="255" /></label>
		<label class="form-label"><?php echo lang( 'account_confirm_password' ); ?>: <span class="txt_require">*</span><input type="password" name="account_confirm_password" value="" maxlength="255" /></label>
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
		
		<?php echo $this->modules_plug->do_action( 'account_register_form_bottom' ); ?> 
		<button type="submit" class="bb-button"><?php echo lang( 'account_register' ); ?></button> <?php if ( $this->config_model->load_single( 'member_verification' ) == '1' ) {echo anchor( 'account/resend-activate', lang( 'account_not_get_verify_email' ) );} ?>
	</div>
	<?php endif; ?> 
<?php echo form_close(); ?> 