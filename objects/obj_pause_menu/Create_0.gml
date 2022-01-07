/// @description Options and appearance

// Inherit the parent event
event_inherited();

// Enum for menu options
enum PauseMenuOption {
	RESUME = 3,
	RESTART = 2,
	MAIN_MENU = 1,
	QUIT = 0,
}

// How menu items are drawn
menu_font = fnt_menu;
var num_options = 4;

menu_item_height = font_get_size(menu_font);

// Layout of the menu
back_alpha_start = 0;
menu_x_start = global.display_width/2;
menu_y_start = 1.5*global.gui_height + 1.5*menu_item_height*(num_options/2);

back_alpha_end = 0.3;
menu_x_end = global.display_width/2;
menu_y_end = 0.5*global.display_height + 1.5*menu_item_height*(num_options/2);
menu_speed = 0.2;


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
sel_suffix = " <";

halign = fa_center;
valign = fa_bottom;

// Menu items
ll_menu_options[PauseMenuOption.RESUME][0] = "Resume";
ll_menu_options[PauseMenuOption.RESTART][0] = "Restart Stage";
ll_menu_options[PauseMenuOption.MAIN_MENU][0] = "Return to Main Menu";
ll_menu_options[PauseMenuOption.QUIT][0] = "Quit Game";

init_selected_x = 0;
init_selected_y = PauseMenuOption.RESUME;

allow_cancel = true; // Don't allow cancelling out of this menu

commit_delay = 15;