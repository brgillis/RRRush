/// @description Start the music and enable particles

title_music = audio_play_sound(msc_title, 0, true);

particle_system_between = part_system_create_layer("Effects_between", 0);
particle_system_gui = part_system_create_layer("Effects_gui", 0);
part_system_automatic_draw(particle_system_gui, false); // Need to manually draw on GUI layer

title_dismiss_fspeed = 0.1;
title_is_dismissed = false;

title_seq_element_id = -1;

title_layer = layer_get_id("GUI_assets");

text_glitter = false;

function dismiss_title() {
	/// @description Dismisses the title, causing it to go offscreen
	
	// Find the sequence element ID of the title
	if (title_seq_element_id==-1)
	{
		var l_seq_ids = layer_get_all_elements(title_layer);
		var num_seq = array_length(l_seq_ids);
		for (var i = 0; i <num_seq; ++i;)
		{
			var _seq_element_id = l_seq_ids[i];
			var _seq = layer_sequence_get_sequence(_seq_element_id);
			if (_seq.name=="seq_title")
			{
				title_seq_element_id = _seq_element_id;
				break;
			}
		}
	}
	
	title_x_start = layer_sequence_get_x(title_seq_element_id);
	title_y_start = layer_sequence_get_y(title_seq_element_id);
	
	title_x_end = 3*global.DISPLAY_WIDTH/2;
	title_y_end = layer_sequence_get_y(title_seq_element_id);
	
	title_is_dismissed = true;
	
}

function recreate_title() {
	/// @description Destroys the dismissed title, and recreates it at the original position
	
	layer_sequence_destroy(title_seq_element_id);
	title_seq_element_id = layer_sequence_create(title_layer, title_x_start, title_y_start, seq_title);
	
	title_is_dismissed = false;
}