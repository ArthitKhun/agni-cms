<div class="list-posts">
	<?php
	if ( isset( $list_item['items'] ) ) {
		foreach ( $list_item['items'] as $row ) {
			$post_url = (isset( $cat ) ? $cat->t_uris.'/'.$row->post_uri_encoded : 'post/'.$row->post_uri_encoded );
			?> 
	<article class="each-post post-id-<?php echo $row->post_id; ?>">
		<header>
			<h2><?php echo anchor( $post_url, $row->post_name ); ?></h2>
			<small>
				<time pubdate="" datetime="<?php echo gmt_date( 'Y-m-d', $row->post_publish_date_gmt ); ?>"><?php echo gmt_date( 'j F Y', $row->post_publish_date_gmt ); ?></time>
				<?php echo lang( 'post_by' ); ?> <?php echo anchor( 'author/'.$row->account_username, $row->account_username, array( 'rel' => 'author' ) ); ?> 
			</small>
		</header>
		<?php 
		if ( $row->post_feature_image != null ) {
			$this->load->model( 'media_model' );
		?> 
		<img src="<?php echo $this->media_model->get_img( $row->post_feature_image, '' ); ?>" alt="" class="post-feature-image" />
		<?php 
		} else {
		?> 
		<img src="<?php echo $this->theme_path; ?>front/images/no-feature-image.png" alt="" class="post-feature-image" />
		<?php 
		}
		?> 
		<div class="entry">
			<?php if ( $row->body_summary != null ) {
				echo $row->body_summary;
			} else {
				echo mb_strimwidth( nl2br( strip_tags( $row->body_value ) ), 0, 255, '...' );
			} ?>
		</div>
		<div class="clear"></div>
		<?php if ( !empty( $row->comment_count ) ): ?><footer><?php echo anchor( $post_url.'#list-comments', sprintf( lang( 'post_total_comment' ), $row->comment_count ) ); ?></footer><?php endif; ?> 
	</article>
		<?php
		}
	}
	// pagination
	if ( isset( $pagination ) ) {
		echo $pagination;
	}
	?> 
</div>