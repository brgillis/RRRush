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

text_com_c1 = $E0E0FF;
text_com_c2 = $E0E0FF;
text_com_c3 = $B0B0D0;
text_com_c4 = $B0B0D0;

text_unsel_c1 = $9090B0;
text_unsel_c2 = $9090B0;
text_unsel_c3 = $606080;
text_unsel_c4 = $606080;

sel_prefix = "> ";
sel_suffix = "";

halign = fa_right;
valign = fa_bottom;

// Menu items
ll_menu_options[MainMenuOption.NEW_GAME][0] = "New Game";
ll_menu_options[MainMenuOption.CONTINUE][0] = "Continue";
ll_menu_options[MainMenuOption.LEVEL_SELECT][0] = "Level Select";
ll_menu_options[MainMenuOption.QUIT][0] = "Quit";
