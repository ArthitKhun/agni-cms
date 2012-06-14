<h1><?php echo lang( 'account_edit_profile' ); ?></h1>

<?php echo form_open_multipart(); ?> 
	<?php if ( isset( $form_status ) ) {echo $form_status;} ?> 
	
	<div class="page-edit-profile">
		<label class="form-label"><?php echo lang( 'account_username' ); ?>:<input type="text" name="account_username" value="<?php if ( isset( $account_username ) ) {echo $account_username;} ?>" maxlength="255" disabled="disabled" /><span class="txt_require">*</span></label>
		<label class="form-label"><?php echo lang( 'account_email' ); ?>:<input type="email" name="account_email" value="<?php if ( isset( $account_email ) ) {echo $account_email;} ?>" maxlength="255" /><span class="txt_require">*</span></label>
		<label class="form-label"><?php echo lang( 'account_password' ); ?>:<input type="password" name="account_password" value="" maxlength="255" /><?php if ( $this->uri->segment(3) == 'add' ): ?><span class="txt_require">*</span><?php else: ?><span class="txt_comment"><?php echo lang( 'account_enter_current_if_change' ); ?></span><?php endif; ?></label> 
		<label class="form-label"><?php echo lang( 'account_new_password' ); ?>:<input type="password" name="account_new_password" value="" maxlength="255" /><span class="txt_comment"><?php echo lang( 'account_enter_if_change' ); ?></span></label>
		<?php if ( $allow_avatar == '1' ): ?> 
		<label class="form-label"><?php echo lang( 'account_avatar' ); ?>: <?php if ( isset( $account_avatar ) && $account_avatar != null ): ?><?php echo anchor( '#', lang( 'account_delete_avatar' ), array( 'onclick' => 'return ajax_delete_avatar()' ) ); ?><br />
			<div class="account-avatar-wrap"><img src="<?php echo $this->base_url.$account_avatar; ?>" alt="<?php echo lang( 'account_avatar' ); ?>" class="account-avatar account-avatar-edit" /></div><?php endif; ?>
			<input type="file" name="account_avatar" /><br />
			<span class="txt_comment">&lt;= <?php echo $avatar_size; ?>KB. <?php echo str_replace( '|', ', ', $avatar_allowed_types ); ?></span>
		</label>
		<?php endif; ?> 
		<label class="form-label"><?php echo lang( 'account_fullname' ); ?>:<input type="text" name="account_fullname" value="<?php if ( isset( $account_fullname ) ) {echo $account_fullname;} ?>" maxlength="255" /></label>
		<label class="form-label"><?php echo lang( 'account_birthdate' ); ?>:<input type="date" name="account_birthdate" value="<?php if ( isset( $account_birthdate ) ) {echo $account_birthdate;} ?>" maxlength="10" /><span class="txt_comment"><?php echo lang( 'account_birthdate_format' ); ?></span></label>
		<?php /*<label class="form-label"><?php echo lang( 'account_signature' ); ?>:<textarea name="account_signature" cols="30" rows="5"><?php if ( isset( $account_signature ) ) {echo $account_signature;} ?></textarea></label>*/ // not use? ?>
		<label class="form-label"><?php echo lang( 'account_timezone' ); ?>:<?php echo timezone_menu( (isset($account_timezone) ? $account_timezone : $this->config_model->load_single( 'site_timezone' )), '', 'account_timezone' ); ?></label>
		
		<?php echo $this->modules_plug->do_action( 'account_edit_profile_form_bottom' ); ?> 
		<button type="submit" class="bb-button"><?php echo lang( 'account_save' ); ?></button> <?php echo anchor( 'account/view-logins', lang( 'account_view_logins' ) ); ?>
	</div>
<?php echo form_close(); ?> 

<script type="text/javascript">
$(document).ready(function() {
	$("input[name=account_birthdate]").datepicker({ 
		dateFormat: 'yy-mm-dd',
		changeMonth: true,
		changeYear: true,
		yearRange: '1900:'+(new Date).getFullYear()
	});
});// jquery document ready

function ajax_delete_avatar() {
	$confirm = confirm( '<?php echo lang( 'account_are_you_sure_delete_avatar' ); ?>' );
	if ( $confirm == true ) {
		$.ajax({
			url: site_url+'account/edit-profile/delete-avatar',
			type: 'POST',
			data: csrf_name+'='+csrf_value+'&account_id=<?php echo $account_id; ?>',
			dataType: 'json',
			success: function( data ) {
				if ( data.result == true ) {
					$('.account-avatar-wrap').remove();
				}
			},
			error: function( data, status, e ) {
				alert( e );
			}
		});
		return false;
	} else {
		return false;
	}
}
</script>