<h1><?php echo lang( 'plugins_plugins' ); ?></h1>

<div class="cmds">
	<div class="cmd-left">
		<button type="button" class="bb-button standard" onclick="window.location=site_url+'site-admin/plugin/add';"><?php echo lang( 'admin_add' ); ?></button>
		| <?php echo sprintf( lang( 'plugins_all' ), $list_item['total'] ); ?>
		| <?php echo sprintf( lang( 'plugins_inactive' ), ($list_item['total']-$this->db->count_all_results( 'plugins' )) ); ?>
	</div>
	<div class="clear"></div>
</div>

<?php echo form_open( 'site-admin/plugin/process_bulk' ); ?> 
	<?php if ( isset( $form_status ) ) {echo $form_status;} ?> 

	<table class="list-items">
		<thead>
			<tr>
				<th class="check-column"><input type="checkbox" name="id_all" value="" onclick="checkAll(this.form,'id[]',this.checked)" /></th>
				<th><?php echo lang( 'plugins_name' ); ?></th>
				<th><?php echo lang( 'plugins_description' ); ?></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th class="check-column"><input type="checkbox" name="id_all" value="" onclick="checkAll(this.form,'id[]',this.checked)" /></th>
				<th><?php echo lang( 'plugins_name' ); ?></th>
				<th><?php echo lang( 'plugins_description' ); ?></th>
			</tr>
		</tfoot>
		<tbody>
		<?php if ( isset( $list_item['items'] ) && is_array( $list_item['items'] ) ): ?>
		<?php foreach ( $list_item['items'] as $key ): ?> 
			<tr>
				<td class="check-column"><?php echo form_checkbox( 'id[]', $key['plugin_system_name']); ?></td>
				<td>
					<strong><?php if ( !empty( $key['plugin_name'] ) ): ?><?php echo $key['plugin_name']; ?><?php else: ?><em title="<?php echo lang( 'plugins_no_name' ); ?>"><?php echo $key['plugin_system_name']; ?></em><?php endif; ?></strong>
					<div><?php if ( $key['plugin_activated'] == 'yes' ): ?> 
						<?php echo anchor( 'site-admin/plugin/deactivate?id='.$key['plugin_system_name'], lang( 'plugins_deactivate' ) ); ?> 
						<?php if ( $this->modules_plug->do_action( 'plugin_havesettings_'.$key['plugin_system_name'] ) === true ): ?>| <?php echo anchor( 'site-admin/plugin/settings/'.$key['plugin_system_name'], lang( 'plugins_settings' ) ); ?><?php endif; ?> 
					<?php else: ?> 
						<?php echo anchor( 'site-admin/plugin/activate?id='.$key['plugin_system_name'], lang( 'plugins_activate' ) ); ?> 
						| <?php echo anchor( 'site-admin/plugin/delete?id='.$key['plugin_system_name'], lang( 'admin_delete' ), array( 'onclick' => 'return confirm(\''.sprintf( lang( 'plugins_are_you_sure_delete' ), (!empty( $key['plugin_name']) ?$key['plugin_name'] : $key['plugin_system_name']), $key['plugin_author_name'] ).'\');' ) ); ?> 
					<?php endif; ?>
					</div>
				</td>
				<td>
					<p><?php echo $key['plugin_description']; ?></p>
					<p>
						<?php echo lang( 'plugins_version' ); ?>: <?php echo (!empty( $key['plugin_version'] ) ? $key['plugin_version'] : '-' ); ?> 
						| <?php echo lang( 'plugins_by' ); ?>: <?php if ( !empty( $key['plugin_author_name'] ) ) {if ( !empty( $key['plugin_author_url'] ) ) {echo anchor( $key['plugin_author_url'], $key['plugin_author_name'] );} else {echo $key['plugin_author_name'];}} else {echo '-';} ?> 
						<?php if ( !empty( $key['plugin_url'] ) ): ?>| <?php echo anchor( $key['plugin_url'], lang( 'plugins_visit_site' ) ); ?><?php endif; ?>
					</p>
				</td>
			</tr>
		<?php endforeach; ?> 
		<?php else: ?> 
			<tr>
				<td colspan="3"><?php echo lang( 'admin_nodata' ); ?></td>
			</tr>
		<?php endif; ?> 
		</tbody>
	</table>
	
	<div class="cmds">
		<div class="cmd-left">
			<select name="act">
				<option value="" selected="selected"></option>
				<option value="activate"><?php echo lang( 'plugins_activate' ); ?></option>
				<option value="deactivate"><?php echo lang( 'plugins_deactivate' ); ?></option>
				<option value="del"><?php echo lang( 'admin_delete' ); ?></option>
			</select>
			<button type="submit" class="bb-button"><?php echo lang( 'admin_submit' ); ?></button>
		</div>
		<div class="cmd-right">
			<?php if ( isset( $pagination ) ) {echo $pagination;} ?>
		</div>
		<div class="clear"></div>
	</div>
<?php echo form_close(); ?> 
