/// @description Options and appearance

// Inherit the parent event
event_inherited();

// Font
l_item_font = [fnt_controls];

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

l_menu_rows[Line.MOVE_LEFT] = new MenuRow("A or left arrow", "Move left:", false);
l_menu_rows[Line.MOVE_RIGHT] = new MenuRow("D or right arrow", "Move left:", false);
l_menu_rows[Line.RUN] = new MenuRow("Hold tab, shift, or right mouse button", "Run:", false);
l_menu_rows[Line.JUMP] = new MenuRow("W, up arrow, Space, or left mouse button", "Jump:", false);
l_menu_rows[Line.HIGH_JUMP] = new MenuRow("Hold jump button longer for extra height", "High jump:", false);
l_menu_rows[Line.SUPER_JUMP] = new MenuRow("Jump just after landing for even more height", "Super jump:", false);
l_menu_rows[Line.HOLD_GLITTER] = new MenuRow("Hold run button", "Keep glitterishness:", false);
l_menu_rows[Line.CONFIRM] = new MenuRow("Space, Enter, or left mouse button", "Confirm:", false);
l_menu_rows[Line.CANCEL] = new MenuRow("Tab, shift, or right mouse button", "Cancel:", false);
l_menu_rows[Line.PAUSE] = new MenuRow("Return, P, or middle mouse button", "Pause:", false);
l_menu_rows[Line.RESTART] = new MenuRow("R", "Restart stage:", false);
l_menu_rows[Line.RESET] = new MenuRow("T or F5", "Reset game:", false);
l_menu_rows[Line.BLANK] = new MenuRow([], false, false);
l_menu_rows[Line.BACK] = new MenuRow("Back", false, true);

offset_labels = true;

// How menu items are drawn

menu_item_height = font_get_size(l_item_font[0]);
menu_item_width = 0.5*string_length(l_menu_rows[Line.SUPER_JUMP].label)*font_get_size(l_item_font[0]);

l_c_item_outline = global.TEXT_NO_OUTLINE;
l_c_text_unsel = c_black;

// How labels are drawn

l_c_label_outline = global.TEXT_NO_OUTLINE;
l_c_label = c_black;
l_label_font = fnt_controls_label;

// Layout of the menu
menu_x_start =  0.35 * global.DISPLAY_WIDTH - menu_item_width;
menu_y_start = -global.GUI_HEIGHT;
menu_x_end = 0.35 * global.DISPLAY_WIDTH - menu_item_width;
menu_y_end = global.DISPLAY_HEIGHT/2 + 1.5*menu_item_height*(num_lines/2);
menu_speed = 0.1;

sel_prefix = "> ";
sel_suffix = " <";

l_item_halign = fa_left;
l_item_valign = fa_bottom;

// Which item is selected initially
init_selected_y = Line.BACK;

// After setting everything up, call the parent's post_init to finalize creation
menu_post_init();