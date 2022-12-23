/// @description Options and appearance

// Inherit the parent event
event_inherited();

// Enum for menu options
enum MainMenuOption {
	NEW_GAME = 4,
	CONTINUE = 3,
	LEVEL_SELECT = 2,
	CONTROLS = 1,
	QUIT = 0,
}

num_lines = MainMenuOption.NEW_GAME + 1;
menu_item_height = 1.5 * font_get_size(menu_font);

// Layout of the menu
menu_x_start = global.display_width/2;
menu_y_start = global.display_height + (num_lines+2)*menu_item_height;
menu_x_end = global.display_width/2;
menu_y_end = global.gui_height - 0.75*menu_item_height;
menu_speed = 0.04;

// How menu items are drawn

sel_prefix = "> ";
sel_suffix = " <";

halign = fa_center;
valign = fa_bottom;

// Menu items
ll_menu_options[MainMenuOption.NEW_GAME] = ["New Game"];
ll_menu_options[MainMenuOption.CONTINUE] = ["Continue"];
ll_menu_options[MainMenuOption.LEVEL_SELECT] = ["Level Select"];
ll_menu_options[MainMenuOption.CONTROLS] = ["View Controls"];
ll_menu_options[MainMenuOption.QUIT] = ["Quit"];

// Disabled menu items
ll_disabled_options[MainMenuOption.NEW_GAME][0] = false;
ll_disabled_options[MainMenuOption.CONTINUE][0] = true;
ll_disabled_options[MainMenuOption.LEVEL_SELECT][0] = false;
ll_disabled_options[MainMenuOption.CONTROLS][0] = false;
ll_disabled_options[MainMenuOption.QUIT][0] = false;

allow_cancel = false; // Don't allow cancelling out of this menu