/// @description Execute menu choice

// Inherit the parent event
event_inherited();

switch (menu_committed_y)
{
case CompleteMenuOption.NEXT: default:
	// TODO: Fix this to transition to next room
	room_transition(TransMode.RESTART);
	break;
case CompleteMenuOption.RESTART:
	// Restart room
	room_transition(TransMode.RESTART);
	break;
case CompleteMenuOption.MAIN_MENU:
	// Switch to main menu
	room_transition(TransMode.GOTO, rm_title_menu);
	break;
case PauseMenuOption.QUIT:
	// CompleteMenuOption the game
	game_end();
	break;
}