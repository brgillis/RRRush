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

// How menu items are drawn
menu_font = fnt_menu;

menu_item_height = font_get_size(menu_font);
menu_item_width = 5*font_get_size(menu_font);

// Layout of the menu
menu_x_start = global.display_width/2 - menu_item_width*(num_stages/2-0.5);
menu_y_start = -global.gui_height;
menu_x_end = global.display_width/2 - menu_item_width*(num_stages/2-0.5);
menu_y_end = global.display_height/2 + 1.5*menu_item_height*(num_worlds/2);
menu_speed = 0.1;

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
for(var world_index=num_worlds; world_index>=1; world_index--)
{
	for(var stage_index=num_stages-1; stage_index>=0; stage_index--)
	{
		var world_number = num_worlds-world_index+1;
		var stage_number = stage_index+1;
		
		ll_menu_options[world_index][stage_index] = string(world_number)+"-"+string(stage_number);
	}
}

ll_menu_options[WorldSelectOption.BACK][0] = "Back";
