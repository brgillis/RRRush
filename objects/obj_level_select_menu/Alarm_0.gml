/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
	default:
	
		var _target_room = global.LL_ROOM_TARGETS[menu_committed_y][menu_committed_x];
		
		// Set up the persistent object with info for the target stage
		obj_persistent.world_index = menu_committed_y;
		obj_persistent.stage_index = menu_committed_x;
		
		// Transition to the target room
		obj_persistent.room_transition(TransMode.GOTO, _target_room, obj_menu_music.title_music);
		
		break;
		
	case WorldSelectOption.DEBUG:
		if (menu_committed_x==0)
			obj_persistent.room_transition(TransMode.GOTO, rm_playroom, obj_menu_music.title_music)
		else
			obj_persistent.room_transition(TransMode.GOTO, rm_test_stage, obj_menu_music.title_music)
		break;
		
	case WorldSelectOption.BACK: case global.MENU_CANCEL:
		// Return to the title menu
		instance_create_layer(0,0,"Instances",obj_title_menu);
		instance_destroy();
		break;
}