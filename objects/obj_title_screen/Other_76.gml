/// @description Check for broadcast from title sequence

if event_data[? "event_type"] != "sequence event"
	exit;
	
var _seq_id = event_data[? "element_id"];
var _seq_x = layer_sequence_get_x(_seq_id);
var _seq_y = layer_sequence_get_y(_seq_id);

glitter_y_min = _seq_y-60;
glitter_y_max = _seq_y+80;
glitter_rate = 0.5;

switch (event_data[? "message"])
{
	case "title_end":
		layer_sequence_headpos(_seq_id, 160);
		break;
		
	case "burst_right1":
		
		text_glitter = true;
		glitter_x_min = _seq_x-250;
		glitter_x_max = _seq_x+84;
		
		burst_rect(particle_system_gui, _seq_x+84, _seq_x+84, _seq_y-40, _seq_y+80,
		           obj_persistent.glitter_collect, 20);
		break;
		
	case "burst_right2":
		
		burst_rect(particle_system_gui, _seq_x+84, _seq_x+84, _seq_y-40, _seq_y+80,
		           obj_persistent.glitter_collect, 20);
		break;
		
	case "burst_left":
		
		glitter_x_min = _seq_x-575;
		glitter_x_max = _seq_x+84;
		glitter_rate *= 2;
		
		burst_rect(particle_system_gui, _seq_x-200, _seq_x-200, _seq_y-40, _seq_y+80,
		           obj_persistent.glitter_collect, 20);
		break;
}
