/// @description Options and appearance

// Inherit the parent event
event_inherited();

var num_lines = WorldSelectOption.WORLD_1 + 1;

var ll_disabled_options;

ll_disabled_options[WorldSelectOption.WORLD_1] = [false, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_2] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_3] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_4] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_5] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_6] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_7] = [true, true, true, true]
ll_disabled_options[WorldSelectOption.WORLD_8] = [true, true, true, true]

// How menu items are drawn

l_item_font = [fnt_level_select_menu];

menu_item_height = font_get_size(l_item_font[0]);
menu_item_width = 5*font_get_size(l_item_font[0]);

// Layout of the menu
menu_x_start = global.DISPLAY_WIDTH/2 - menu_item_width*(global.NUM_STAGES/2-0.5);
menu_y_start = -global.GUI_HEIGHT;
menu_x_end = global.DISPLAY_WIDTH/2 - menu_item_width*(global.NUM_STAGES/2-0.5);
menu_y_end = global.DISPLAY_HEIGHT/2 + 1.5*menu_item_height*(num_lines/2);
menu_speed = 0.1;

sel_prefix = "> ";
sel_suffix = " <";

l_item_halign = fa_center;
l_item_valign = fa_bottom;

// Menu items
for(var world_index=WorldSelectOption.WORLD_1; world_index>=WorldSelectOption.WORLD_8; world_index--)
{
	var l_items = []
	for(var stage_index=global.NUM_STAGES-1; stage_index>=0; stage_index--)
	{
		var world_number = get_world_number(world_index);
		var stage_number = get_stage_number(stage_index);
		
		l_items[stage_index] = new MenuItem(string(world_number)+"-"+string(stage_number),
		                                    ll_disabled_options[world_index][stage_index]);
	}
	l_menu_rows[world_index] = new MenuRow(l_items)
}

l_menu_rows[WorldSelectOption.DEBUG] = new MenuRow( [ new MenuItem("Play"), new MenuItem("Test") ] );
l_menu_rows[WorldSelectOption.BACK] = new MenuRow("Back");

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();
