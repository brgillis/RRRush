/// @description Options and appearance

/// Special handling for the pause menu - stop all animations

// Stop instance animations and save image speed
var num_inst = instance_number(all);
for (var i = 0; i < num_inst; ++i;)
{
	var instance = instance_find(all, i);
    l_instance_image_speed[i] = instance.image_speed;
	instance.image_speed = 0;
}

// Pause sequence animations
var _l_seq_ids = layer_get_all_elements("Interact_assets");
var _num_seq = array_length(_l_seq_ids);
for (var i = 0; i <_num_seq; ++i;)
{
	var seq = _l_seq_ids[i];
	layer_sequence_pause(seq);
}

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
l_item_font = [fnt_menu];
var num_options = PauseMenuOption.RESUME + 1;

menu_item_height = font_get_size(l_item_font[0]);

// Layout of the menu
back_alpha_start = 0;
menu_x_start = global.display_width/2;
menu_y_start = 1.5*global.gui_height + 1.5*menu_item_height*(num_options/2);

back_alpha_end = 0.5;
menu_x_end = global.display_width/2;
menu_y_end = 0.5*global.display_height + 1.5*menu_item_height*(num_options/2);
menu_speed = 0.2;


// How menu items are drawn

sel_prefix = "> ";
sel_suffix = " <";

l_item_halign = fa_center;
l_item_valign = fa_bottom;

// Menu items
l_menu_rows[PauseMenuOption.RESUME] = new MenuRow("Resume");
l_menu_rows[PauseMenuOption.RESTART] = new MenuRow("Restart Stage (R)");
l_menu_rows[PauseMenuOption.MAIN_MENU] = new MenuRow("Return to Main Menu (T)");
l_menu_rows[PauseMenuOption.QUIT] = new MenuRow("Quit Game");

init_selected_x = 0;
init_selected_y = PauseMenuOption.RESUME;

allow_cancel = true;

commit_delay = 15;

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();