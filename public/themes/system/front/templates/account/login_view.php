<h1><?php echo lang( 'account_login' ); ?></h1>

<?php echo form_open( current_url().( isset( $go_to ) ? '?rdr='.$go_to : '' ) ); ?> 
	<?php if ( isset( $form_status ) ) {echo $form_status;} ?> 
	
	<label class="form-label"><?php echo lang( 'account_username' ); ?>:<input type="text" name="account_username" value="<?php if ( isset( $account_username ) ) {echo $account_username;} ?>" maxlength="255" /></label>
	<label class="form-label"><?php echo lang( 'account_password' ); ?>:<input type="password" name="account_password" maxlength="255" /></label>
	<label class="form-label"><input type="checkbox" name="remember" value="yes" /> <?php echo lang( 'account_remember_my_login' ); ?></label>
	
	<?php if ( isset( $show_captcha ) && $show_captcha == true ): ?> 
	<label class="form-label captcha-field">
		<?php echo lang( 'account_captcha' ); ?>:<br />
		<img src="<?php echo $this->base_url; ?>public/images/securimage_show.php" alt="securimage" class="captcha" />
		<a href="#" onclick="$('.captcha').attr( 'src', '<?php echo $this->base_url; ?>public/images/securimage_show.php?' + Math.random() ); return false" tabindex="-1"><img src="<?php echo $this->base_url; ?>public/images/reload.gif" alt="" /></a>
		<input type="text" name="captcha" value="<?php if ( isset( $captcha ) ) {echo $captcha;} ?>" class="input-captcha" autocomplete="off" />
	</label>
	<?php endif; ?> 
	
	<button type="submit" class="bb-button"><?php echo lang( 'account_login' ); ?></button> <?php echo anchor( 'account/forgotpw', lang( 'account_forget_userpass' ) ); ?> 
	
<?php echo form_close(); ?> 