/// @description Options and appearance

/// Special handling for the level complete menu - stop all animations

// Stop instance animations and save image speed
var num_inst = instance_number(all);
for (var i = 0; i < num_inst; ++i;)
{
	var instance = instance_find(all, i);
    l_instance_image_speed[i] = instance.image_speed;
	instance.image_speed = 0;
}

// Pause sequence animations
l_seq_ids = layer_get_all_elements("Interact_assets");
num_seq = array_length(l_seq_ids);
for (var i = 0; i <num_seq; ++i;)
{
	var seq = l_seq_ids[i];
	layer_sequence_pause(seq);
}

// Inherit the parent event
event_inherited();

// Enum for menu options
enum CompleteMenuOption {
	MESSAGE = 8,
	BLANK1 = 7,
	CURTIME = 6,
	BESTTIME = 5,
	BLANK2 = 4,
	NEXT = 3,
	RESTART = 2,
	MAIN_MENU = 1,
	QUIT = 0,
}

// How menu items are drawn
l_item_font = [fnt_menu];
var num_options = CompleteMenuOption.MESSAGE + 1;

menu_item_height = font_get_size(l_item_font[0]);

// Layout of the menu
back_alpha_start = 0;
menu_x_start = global.DISPLAY_WIDTH/2;
menu_y_start = 1.5*global.GUI_HEIGHT + 1.5*menu_item_height*(num_options/2);

back_alpha_end = 0.5;
menu_x_end = global.DISPLAY_WIDTH/2;
menu_y_end = 0.5*global.DISPLAY_HEIGHT + 1.5*menu_item_height*(num_options/2);
menu_speed = 0.05;


// How menu items are drawn

sel_prefix = "> ";
sel_suffix = " <";

l_item_halign = fa_center;
l_item_valign = fa_bottom;

// Menu items
var _msg_stage_complete = ("Stage " + string(obj_persistent.world_number) + "-" +
						   string(obj_persistent.stage_number) + " Complete!");
var _msg_time = "Time: " + get_time_string(obj_game.time_frames);

if (obj_persistent.best_time_frames < obj_persistent.old_best_time_frames)
{
	var _msg_best_time = ("Best Time: " + get_time_string(obj_persistent.old_best_time_frames)
	                      + " -> " + get_time_string(obj_persistent.best_time_frames));
}
else
{
	var _msg_best_time = "Best Time: " + get_time_string(obj_persistent.best_time_frames);
}

l_menu_rows[CompleteMenuOption.MESSAGE] = new MenuRow(_msg_stage_complete, false, false);
l_menu_rows[CompleteMenuOption.BLANK1] = new MenuRow("", false, false);
l_menu_rows[CompleteMenuOption.CURTIME] = new MenuRow(_msg_time, false, false);
l_menu_rows[CompleteMenuOption.BESTTIME] = new MenuRow(_msg_best_time, false, false);
l_menu_rows[CompleteMenuOption.BLANK2] = new MenuRow("", false, false);
l_menu_rows[CompleteMenuOption.NEXT] = new MenuRow("Next Stage");
l_menu_rows[CompleteMenuOption.RESTART] = new MenuRow("Restart Stage (R)");
l_menu_rows[CompleteMenuOption.MAIN_MENU] = new MenuRow("Return to Main Menu (T)");
l_menu_rows[CompleteMenuOption.QUIT] = new MenuRow("Quit Game");

init_selected_x = 0;
init_selected_y = CompleteMenuOption.NEXT;

allow_cancel = false;

commit_delay = 15;

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();