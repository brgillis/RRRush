/// @description Move title if desired

if (title_is_dismissed)
{
	var _seq_x = layer_sequence_get_x(title_seq_element_id);
	var _seq_y = layer_sequence_get_y(title_seq_element_id);
	
	_seq_x += (title_x_end - _seq_x) * title_dismiss_fspeed;
	_seq_y += (title_y_end - _seq_y) * title_dismiss_fspeed;
	
	layer_sequence_x(title_seq_element_id, _seq_x);
	layer_sequence_y(title_seq_element_id, _seq_y);
}