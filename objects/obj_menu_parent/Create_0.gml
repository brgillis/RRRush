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

// How menu items are drawn
menu_font = fnt_menu;

// Text color if item is currently selected
text_sel_c1 = $0000B0;
text_sel_c2 = $0000B0;
text_sel_c3 = $000080;
text_sel_c4 = $000080;

// Text color if disabled item is currently selected
text_dis_sel_c1 = $404040;
text_dis_sel_c2 = $404040;
text_dis_sel_c3 = $000000;
text_dis_sel_c4 = $000000;

// Text color if item is confirmed
text_com_c1 = $0000FF;
text_com_c2 = $0000FF;
text_com_c3 = $0000D0;
text_com_c4 = $0000D0;

// Text color if item is not selected
text_unsel_c1 = $C0C0FF;
text_unsel_c2 = $C0C0FF;
text_unsel_c3 = $A0A0C0;
text_unsel_c4 = $A0A0C0;

// Text color if disabled item is not selected
text_dis_unsel_c1 = $808080;
text_dis_unsel_c2 = $808080;
text_dis_unsel_c3 = $404040;
text_dis_unsel_c4 = $404040;

sel_prefix = "> ";
sel_suffix = "";

// Alignment for menu options
halign = fa_right;
valign = fa_bottom;

// Alignment for labels
label_halign = fa_right;
label_valign = fa_bottom;

// menu_item_height is determined from the font size
menu_item_width = 500;

// Menu items
ll_menu_options[0][0] = "Option";
ll_disabled_options = [];
l_row_labels = [];

// Whether or not to offset labels to the left of options
offset_labels = true;

// Menu control

// Which item is selected initially
init_selected_x = global.MENU_NO_OPTION;
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
	menu_cursor_x = init_selected_x;
	menu_cursor_y = init_selected_y;
	
	back_alpha = back_alpha_start;
	menu_x = menu_x_start;
	menu_y = menu_y_start;
	
	back_alpha_target = back_alpha_end;
	menu_x_target = menu_x_end;
	menu_y_target = menu_y_end;

	menu_num_rows = array_length(ll_menu_options);
	global_label_offset = 0;
	for (var i = menu_num_rows-1; i >= 0; i--)
	{
		l_menu_num_cols[i] = array_length(ll_menu_options[i]);
		row_label = get_row_label(i)
		if (is_string(row_label))
		{
			l_menu_num_labels[i] = 1;
			// If at least one row has a label, offset all columns by one to allow room for a label column
			global_label_offset = 1;
		}
		else
		{
			l_menu_num_labels[i] = 0;
		}
	}
	
	menu_item_height = font_get_size(menu_font);
	
	init_finalized = true;
}