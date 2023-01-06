/// @description Start the music and enable particles

title_music = audio_play_sound(msc_title, 0, true);

particle_system_between = part_system_create_layer("Effects_between", 0);
particle_system_gui = part_system_create_layer("Effects_gui", 0);

title_dismiss_fspeed = 0.1;
title_is_dismissed = false;

function dismiss_title() {
	/// @description Dismisses the title, causing it to go offscreen
	
	// Find the sequence element ID of the title
	var _l_seq_ids = layer_get_all_elements("GUI_assets");
	var _num_seq = array_length(_l_seq_ids);
	for (var i = 0; i <_num_seq; ++i;)
	{
		var _seq_element_id = _l_seq_ids[i];
		var _seq = layer_sequence_get_sequence(_seq_element_id);
		if (_seq.name=="seq_title")
		{
			title_seq_element_id = _seq_element_id;
			break;
		}
	}
	
	title_x_end = 3*global.display_width/2;
	title_y_end = layer_sequence_get_y(title_seq_element_id);
	
	title_is_dismissed = true;
	
}