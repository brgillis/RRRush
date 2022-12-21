/// @description Options and appearance

// Inherit the parent event
event_inherited();

// Enum for menu options
enum MainMenuOption {
	NEW_GAME = 3,
	CONTINUE = 2,
	LEVEL_SELECT = 1,
	QUIT = 0,
}

// Layout of the menu
menu_x_start = global.display_width/2;
menu_y_start = 3*global.display_height/2;
menu_x_end = global.display_width/2;
menu_y_end = global.gui_height;
menu_speed = 0.04;

// How menu items are drawn

sel_prefix = "> ";
sel_suffix = " <";

halign = fa_center;
valign = fa_bottom;

// Menu items
ll_menu_options[MainMenuOption.NEW_GAME][0] = "New Game";
ll_menu_options[MainMenuOption.CONTINUE][0] = "Continue";
ll_menu_options[MainMenuOption.LEVEL_SELECT][0] = "Level Select";
ll_menu_options[MainMenuOption.QUIT][0] = "Quit";

// Disabled menu items
ll_disabled_options[MainMenuOption.NEW_GAME][0] = false;
ll_disabled_options[MainMenuOption.CONTINUE][0] = true;
ll_disabled_options[MainMenuOption.LEVEL_SELECT][0] = false;
ll_disabled_options[MainMenuOption.QUIT][0] = false;

allow_cancel = false; // Don't allow cancelling out of this menu