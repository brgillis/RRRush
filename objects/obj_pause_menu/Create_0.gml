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
item_font = fnt_menu;
var num_options = PauseMenuOption.RESUME + 1;

menu_item_height = font_get_size(item_font);

// Layout of the menu
back_alpha_start = 0;
menu_x_start = global.display_width/2;
menu_y_start = 1.5*global.gui_height + 1.5*menu_item_height*(num_options/2);

back_alpha_end = 0.3;
menu_x_end = global.display_width/2;
menu_y_end = 0.5*global.display_height + 1.5*menu_item_height*(num_options/2);
menu_speed = 0.2;


// How menu items are drawn

l_c_text_sel = [ $0000B0, $000080 ];
l_c_text_conf = [ $E0E0FF, $B0B0D0 ];
l_c_text_unsel = [ $9090B0, $A0A6060800C0 ];

sel_prefix = "> ";
sel_suffix = " <";

item_halign = fa_center;
item_valign = fa_bottom;

// Menu items
l_menu_rows[PauseMenuOption.RESUME] = new MenuRow("Resume");
l_menu_rows[PauseMenuOption.RESTART] = new MenuRow("Restart Stage");
l_menu_rows[PauseMenuOption.MAIN_MENU] = new MenuRow("Return to Main Menu");
l_menu_rows[PauseMenuOption.QUIT] = new MenuRow("Quit Game");

init_selected_x = 0;
init_selected_y = PauseMenuOption.RESUME;

allow_cancel = true;

commit_delay = 15;

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();