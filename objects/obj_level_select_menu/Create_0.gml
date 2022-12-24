/// @description Options and appearance

// Inherit the parent event
event_inherited();

// Enums for menu options

enum WorldSelectOption {
	WORLD_1 = 8,
	WORLD_2 = 7,
	WORLD_3 = 6,
	WORLD_4 = 5,
	WORLD_5 = 4,
	WORLD_6 = 3,
	WORLD_7 = 2,
	WORLD_8 = 1,
	BACK = 0,
}

enum StageSelectOption {
	STAGE_4 = 3,
	STAGE_3 = 2,
	STAGE_2 = 1,
	STAGE_1 = 0,
}

var num_worlds = 8;
var num_stages = 4;

ll_room_targets[WorldSelectOption.WORLD_1] = [rm_w1_s1, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_2] = [0, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_3] = [0, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_4] = [0, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_5] = [0, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_6] = [0, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_7] = [0, 0, 0, 0]
ll_room_targets[WorldSelectOption.WORLD_8] = [0, 0, 0, 0]
ll_menu_options[WorldSelectOption.BACK] = ["Back"];

ll_disabled_options[WorldSelectOption.WORLD_1] = [false, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_2] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_3] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_4] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_5] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_6] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_7] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_8] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.BACK] = [false];

// How menu items are drawn

menu_item_height = font_get_size(menu_font);
menu_item_width = 5*font_get_size(menu_font);

// Layout of the menu
menu_x_start = global.display_width/2 - menu_item_width*(num_stages/2-0.5);
menu_y_start = -global.gui_height;
menu_x_end = global.display_width/2 - menu_item_width*(num_stages/2-0.5);
menu_y_end = global.display_height/2 + 1.5*menu_item_height*(num_worlds/2);
menu_speed = 0.1;

sel_prefix = "> ";
sel_suffix = " <";

halign = fa_center;
valign = fa_bottom;

// Menu items
for(var world_index=num_worlds; world_index>=1; world_index--)
{
	for(var stage_index=num_stages-1; stage_index>=0; stage_index--)
	{
		var world_number = num_worlds-world_index+1;
		var stage_number = stage_index+1;
		
		ll_menu_options[world_index][stage_index] = string(world_number)+"-"+string(stage_number);
	}
}

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();
