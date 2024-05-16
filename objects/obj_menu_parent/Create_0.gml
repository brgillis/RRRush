/// @description GUI/Vars/Menu setup

// Set game state to MENU and enable control
set_game_state_menu();
menu_control = true; // Whether or not we have control of the menu
allow_cancel = true; // Whether or not it's possible to cancel out of this menu

// Layout of the menu
back_color = c_black;
back_alpha_start = 0;
menu_x_start = global.DISPLAY_WIDTH+200;
menu_y_start = global.GUI_HEIGHT;

back_alpha_end = 0;
menu_x_end = global.GUI_WIDTH;
menu_y_end = global.GUI_HEIGHT;

menu_speed = 0.04;

/// How menu items are drawn

l_item_font = [fnt_menu];
l_c_item_outline = [c_black];

// Text color if item is currently selected
l_c_text_sel = [ $4040FF, $2020B0 ];

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
l_item_halign = fa_right;
l_item_valign = fa_bottom;


/// How labels are drawn (if left unchanged, will be set to match items)
l_label_font = -1;
l_c_label_outline = -1;
l_c_label = -1;

// Alignment for labels
l_label_halign = fa_right;
l_label_valign = fa_bottom;

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
	
	var num_rows = array_length(l_menu_rows);
	
	// Project item properties to always be a full array
	l_item_font = project_array(l_item_font, num_rows);
	l_c_item_outline = project_array(l_c_item_outline, num_rows);
	l_item_halign = project_array(l_item_halign, num_rows);
	l_item_valign = project_array(l_item_valign, num_rows);
	
	// Set label properties to match item properties if they were left unset
	if (l_label_font==-1)
		l_label_font = l_item_font;
	if (l_c_label_outline==-1)
		l_c_label_outline = l_c_item_outline;
	if (l_c_label==-1)
		l_c_label = l_c_text_unsel;
	
	// Project label properties to always be a full array
	l_label_font = project_array(l_label_font, num_rows);
	l_c_label_outline = project_array(l_c_label_outline, num_rows);
	l_label_halign = project_array(l_label_halign, num_rows);
	l_label_valign = project_array(l_label_valign, num_rows);
	
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
	
	menu_item_height = font_get_size(l_item_font[0]);
}