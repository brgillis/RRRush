/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case CompleteMenuOption.NEXT: default:
	var _l_next_world_stage = get_next_stage(obj_persistent.world_index, obj_persistent.stage_index);
	var _next_room = global.LL_ROOM_TARGETS[_l_next_world_stage[0]][_l_next_world_stage[1]];
	obj_persistent.room_transition(TransMode.GOTO, _next_room);
	break;
case CompleteMenuOption.RESTART:
	// Restart room
	obj_persistent.room_transition(TransMode.RESTART);
	break;
case CompleteMenuOption.MAIN_MENU:
	// Switch to main menu
	obj_persistent.room_transition(TransMode.GOTO, rm_title_menu);
	break;
case PauseMenuOption.QUIT:
	// CompleteMenuOption the game
	game_end();
	break;
}