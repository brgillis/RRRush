/// @description GUI/Vars/Menu setup

// Set game state to MENU and enable control
set_game_state_menu();
menu_control = true; // Whether or not we have control of the menu

// Value to indicate no option is selected
MENU_NO_OPTION = -1;

// Enum for menu options
enum MainMenuOption {
	NEW_GAME = 3,
	CONTINUE = 2,
	LEVEL_SELECT = 1,
	QUIT = 0,
}

// Layout of the menu
menu_x_start = global.display_width+200;
menu_y_start = global.gui_height;
menu_x_end = global.gui_width;
menu_y_end = global.gui_height;
menu_speed = 0.04;

// How menu items are drawn
menu_font = fnt_menu;

text_sel_c1 = $0000B0;
text_sel_c2 = $0000B0;
text_sel_c3 = $000080;
text_sel_c4 = $000080;

text_unsel_c1 = $9090B0;
text_unsel_c2 = $9090B0;
text_unsel_c3 = $606080;
text_unsel_c4 = $606080;

sel_prefix = "> ";
sel_suffix = "";

halign = fa_right;
valign = fa_bottom;

// Menu items
l_menu_options[MainMenuOption.NEW_GAME] = "New Game";
l_menu_options[MainMenuOption.CONTINUE] = "Continue";
l_menu_options[MainMenuOption.LEVEL_SELECT] = "Level Select";
l_menu_options[MainMenuOption.QUIT] = "Quit";

// Menu control

menu_cursor = MENU_NO_OPTION; // Which item is selected
menu_committed = MENU_NO_OPTION;

commit_delay = 30;

// Set a flag to do post-creation tasks (after anything done by child objects) in the Step event
init_finalized = false;