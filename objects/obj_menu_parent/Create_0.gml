/// @description GUI/Vars/Menu setup

// Set game state to MENU and enable control
set_game_state_menu();
menu_control = true; // Whether or not we have control of the menu
allow_cancel = true; // Whether or not it's possible to cancel out of this menu

// Layout of the menu
back_color = c_black;
back_alpha_start = 0;
menu_x_start = global.display_width+200;
menu_y_start = global.gui_height;

back_alpha_end = 0;
menu_x_end = global.gui_width;
menu_y_end = global.gui_height;

menu_speed = 0.04;

/// How menu items are drawn

item_font = fnt_menu;
c_item_outline = c_black;

// Text color if item is currently selected
l_c_text_sel = [ $0000B0, $000080 ];

// Text color if disabled item is currently selected
l_c_text_dis_sel = [ $404040, $000000 ];

// Text color if item is confirmed
l_c_text_conf = [ $0000FF, $0000D0 ];

// Text color if item is not selected
l_c_text_unsel = [ $C0C0FF, $A0A0C0 ];

// Text color if disabled item is not selected
l_c_text_dis_unsel = [ $808080, $404040 ];

sel_prefix = "> ";
sel_suffix = "";

// Alignment for menu options
item_halign = fa_right;
item_valign = fa_bottom;


/// How labels are drawn (if left unchanged, will be set to match items)

label_font = -1;
c_label_outline = -1;

// Alignment for labels
label_halign = fa_right;
label_valign = fa_bottom;

// menu_item_height is determined from the font size
menu_item_width = 500;

// Menu items
l_menu_rows = [];

// Whether or not to offset labels to the left of options
offset_labels = true;

// Menu control

// Which item is selected initially
init_selected_x = 0;
init_selected_y = global.MENU_NO_OPTION;

menu_committed_x = global.MENU_NO_OPTION;
menu_committed_y = global.MENU_NO_OPTION;

commit_delay = 30;

error_delay = 10;

// Functions to check if a directional key press should be registered, allowing for repeat if held down
repeat_delay_first = 20;
repeat_delay_after = 5;
allow_repeat_down = false;


/// Menu post_init - for tasks to be done at the end of creating a child menu object
function menu_post_init() {
	
	if (label_font==-1)
		label_font = item_font;
	if (c_label_outline==-1)
		c_label_outline = c_item_outline;
	
	menu_cursor_x = init_selected_x;
	menu_cursor_y = init_selected_y;
	
	back_alpha = back_alpha_start;
	menu_x = menu_x_start;
	menu_y = menu_y_start;
	
	back_alpha_target = back_alpha_end;
	menu_x_target = menu_x_end;
	menu_y_target = menu_y_end;

	menu_num_rows = array_length(l_menu_rows);
	
	// Set offset to greatest number of labels we see
	global_label_offset = 0;
	for (var i = menu_num_rows-1; i >= 0; i--)
	{		
		num_labels = l_menu_rows[i].num_labels;
		if (num_labels>global_label_offset)
		{
			global_label_offset = num_labels;
		}
	}
	
	menu_item_height = font_get_size(item_font);
}