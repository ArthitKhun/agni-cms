
	<?php echo form_open( current_url().(isset( $go_to ) ? '?rdr='.$go_to : '' ).'#addcomment' ); ?> 
		<?php if ( isset( $form_status ) ) {echo $form_status;} ?> 
		<input type="hidden" name="cmd" value="post_comment" />
		<input type="hidden" name="post_id" value="<?php echo $post_id; ?>" />
		<input type="hidden" name="parent_id" value="<?php if ( isset( $comment_id ) && $comment_id != null ) {echo $comment_id;} ?>" />
		
		<div class="comment-add-wrapper">
			<div class="form-label form-item form-item-name">
				<label><?php echo lang( 'comment_name' ); ?></label> 
				<input type="hidden" name="account_id" value="<?php echo $account_id; ?>" />
				<?php if ( $account_id == '0' ): ?>
				<input type="text" name="name" value="<?php if ( isset( $name ) ) {echo $name;} ?>" maxlength="255" />
				<?php else: ?> 
				<?php $account_username = show_accounts_info( $account_id );
				echo $account_username; ?> 
				<input type="hidden" name="name" value="<?php echo $account_username; ?>" maxlength="255" />
				<?php endif; ?> 
			</div>
			<div class="form-label form-item form-item-subject">
				<label><?php echo lang( 'comment_subject' ); ?></label> <input type="text" name="subject" value="<?php if ( isset( $subject ) ) {echo $subject;} ?>" maxlength="255" />
			</div>
			<div class="form-label form-item form-item-comment-body">
				<label><?php echo lang( 'comment_comment' ); ?></label>
				<textarea name="comment_body_value" cols="60" rows="10"><?php if ( isset( $comment_body_value ) ) {echo $comment_body_value;} ?></textarea>
			</div>
			<div class="form-item form-buttons">
				<button type="submit" class="bb-button"><?php echo lang( 'comment_save' ); ?></button>
			</div>
		</div>
		
	<?php echo form_close(); ?> 