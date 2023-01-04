/// @description Check for broadcast from title sequence

if event_data[? "event_type"] != "sequence event"
	exit;
	
var _seq_id = event_data[? "element_id"];
var _seq_x = layer_sequence_get_x(_seq_id);
var _seq_y = layer_sequence_get_y(_seq_id);

switch (event_data[? "message"])
{
	case "title_end":
		layer_sequence_headpos(_seq_id, 160);
		break;
		
	case "burst_right":
		part_particles_create(particle_system_gui, _seq_x+84, _seq_y+40,
		                      obj_persistent.glitter_collect, 20);
		break;
		
	case "burst_left":
		part_particles_create(particle_system_gui, _seq_x-190, _seq_y+40,
		                      obj_persistent.glitter_collect, 20);
		break;
}
