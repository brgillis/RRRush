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

var num_lines = MainMenuOption.NEW_GAME + 1;
menu_item_height = 1.5 * font_get_size(l_item_font[0]);

// Layout of the menu
menu_x_start = global.display_width/2;
menu_y_start = global.display_height + (num_lines+2)*menu_item_height;
menu_x_end = global.display_width/2;
menu_y_end = global.gui_height - 0.75*menu_item_height;
menu_speed = 0.04;

// How menu items are drawn

sel_prefix = "> ";
sel_suffix = " <";

l_item_halign = fa_center;
l_item_valign = fa_bottom;

// Menu items
l_menu_rows[MainMenuOption.NEW_GAME] = new MenuRow("New Game");
l_menu_rows[MainMenuOption.CONTINUE] = new MenuRow(new MenuItem("Continue", true));
l_menu_rows[MainMenuOption.LEVEL_SELECT] = new MenuRow("Level Select");
l_menu_rows[MainMenuOption.CONTROLS] = new MenuRow("View Controls");
l_menu_rows[MainMenuOption.QUIT] = new MenuRow("Quit");

allow_cancel = false; // Don't allow cancelling out of this menu

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();