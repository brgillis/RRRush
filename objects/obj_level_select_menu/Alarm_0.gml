/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
	default:
		room_transition(TransMode.GOTO, ll_room_targets[menu_committed_y][menu_committed_x]);
		break;
		
	case WorldSelectOption.DEBUG:
		if (menu_committed_x==0)
			room_transition(TransMode.GOTO, rm_playroom)
		else
			room_transition(TransMode.GOTO, rm_test_stage)
		break;
		
	case WorldSelectOption.BACK: case global.MENU_CANCEL:
		// Return to the title menu
		instance_create_layer(0,0,"Instances",obj_title_menu);
		instance_destroy();
		break;
}