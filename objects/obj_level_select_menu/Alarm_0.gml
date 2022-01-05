/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
	case WorldSelectOption.WORLD_1: default:
		switch (menu_committed_x)
		{
			case StageSelectOption.STAGE_1: default:
				room_transition(TransMode.GOTO, rm_w1_parent);
				break;
		}
		break;
		
	case WorldSelectOption.BACK: case MENU_CANCEL:
		// Return to the title menu
		instance_create_layer(0,0,"Instances",obj_title_menu);
		instance_destroy();
		break;
}