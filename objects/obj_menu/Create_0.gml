/// @description GUI/Vars/Menu setup

// Set game state to MENU
set_game_state_menu();

// Size and margin of the GUI
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

// Enum for menu options
enum MainMenuOption {
	NONE = -1,
	NEW_GAME = 3,
	CONTINUE = 2,
	LEVEL_SELECT = 1,
	QUIT = 0,
}

// Layout of the menu
menu_x = gui_width+200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_y_target = gui_height - gui_margin;
menu_speed = 25; // lower is faster
menu_font = fnt_menu;
menu_item_height = font_get_size(fnt_menu);
menu_committed = MainMenuOption.NONE;
menu_control = true; // Whether or not we have control of the menu

l_menu_options[MainMenuOption.NEW_GAME] = "New Game";
l_menu_options[MainMenuOption.CONTINUE] = "Continue";
l_menu_options[MainMenuOption.LEVEL_SELECT] = "Level Select";
l_menu_options[MainMenuOption.QUIT] = "Quit";

menu_num_items = array_length_1d(l_menu_options);
menu_cursor = MainMenuOption.NEW_GAME; // Which item is selected