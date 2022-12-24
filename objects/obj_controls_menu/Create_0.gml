/// @description Options and appearance

// Inherit the parent event
event_inherited();

// Font
menu_font = fnt_controls;

// Enums for menu options

enum Line {
	MOVE_LEFT = 13,
	MOVE_RIGHT = 12,
	RUN = 11,
	JUMP = 10,
	HIGH_JUMP = 9,
	SUPER_JUMP = 8,
	HOLD_GLITTER = 7,
	CONFIRM = 6,
	CANCEL = 5,
	PAUSE = 4,
	RESTART = 3,
	RESET = 2,
	BLANK = 1,
	BACK = 0,
}

num_lines = Line.MOVE_LEFT + 1

ll_menu_options[Line.MOVE_LEFT] = ["A or left arrow"];
ll_menu_options[Line.MOVE_RIGHT] = ["D or right arrow"];
ll_menu_options[Line.RUN] = ["Tab, shift, or right mouse button"];
ll_menu_options[Line.JUMP] = ["W, up array, Space, Enter, or left mouse button"];
ll_menu_options[Line.HIGH_JUMP] = ["Hold jump button longer for extra height"];
ll_menu_options[Line.SUPER_JUMP] = ["Jump just after landing for even more height"];
ll_menu_options[Line.HOLD_GLITTER] = ["Hold run button"];
ll_menu_options[Line.CONFIRM] = ["Space, Enter, or left mouse button"];
ll_menu_options[Line.CANCEL] = ["Tab, shift, or right mouse button"];
ll_menu_options[Line.PAUSE] = ["Return, P, or middle mouse button"];
ll_menu_options[Line.RESTART] = ["R"];
ll_menu_options[Line.RESET] = ["T or F5"];
ll_menu_options[Line.BLANK] = [];
ll_menu_options[Line.BACK] = ["Back"];

l_row_labels[Line.MOVE_LEFT] = "Move left:";
l_row_labels[Line.MOVE_RIGHT] = "Move left:";
l_row_labels[Line.RUN] = "Run:";
l_row_labels[Line.JUMP] = "Jump:";
l_row_labels[Line.HIGH_JUMP] = "High jump:";
l_row_labels[Line.SUPER_JUMP] = "Super jump:";
l_row_labels[Line.HOLD_GLITTER] = "Keep glitterishness:";
l_row_labels[Line.CONFIRM] = "Confirm:";
l_row_labels[Line.CANCEL] = "Cancel:";
l_row_labels[Line.PAUSE] = "Pause:";
l_row_labels[Line.RESTART] = "Restart stage:";
l_row_labels[Line.RESET] = "Reset game:";
l_row_labels[Line.BLANK] = false;
l_row_labels[Line.BACK] = false;

offset_labels = true;

// How menu items are drawn

menu_item_height = font_get_size(menu_font);
menu_item_width = 0.5*string_length(l_row_labels[Line.SUPER_JUMP])*font_get_size(menu_font);

// Layout of the menu
menu_x_start =  0.35 * global.display_width - menu_item_width;
menu_y_start = -global.gui_height;
menu_x_end = 0.35 * global.display_width - menu_item_width;
menu_y_end = global.display_height/2 + 1.5*menu_item_height*(num_lines/2);
menu_speed = 0.1;

sel_prefix = "> ";
sel_suffix = " <";

halign = fa_left;
valign = fa_bottom;

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();