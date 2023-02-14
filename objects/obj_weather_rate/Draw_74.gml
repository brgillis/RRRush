/// @description Draw rate of glitter gain or loss

draw_self();


// Calculate position of bar

// Calculate what the current gain rate is, and set it as the target for the bar
target_position = obj_game.glitter_gain / obj_game.glitter_loss_max_mag

// Move current position toward target position
cur_position = fapproach(cur_position, target_position, 0.1, 0.02)

var _bar_tip_x_offset = wave_position(-O_WR_BAR_OSC_FX_MAG, O_WR_BAR_OSC_FX_MAG, obj_game.time_frames,
									  O_WR_BAR_OSC_FX_PER, O_WR_BAR_OSC_FX_OFF)
var _bar_tip_y_offset = wave_position(-O_WR_BAR_OSC_Y_MAG, O_WR_BAR_OSC_Y_MAG, obj_game.time_frames,
									  O_WR_BAR_OSC_Y_PER, O_WR_BAR_OSC_Y_OFF)

// Direction of bar depends on whether gaining or losing glitterishness
if (cur_position > 0)
{
	var _display_position = sqrt(cur_position) + _bar_tip_x_offset;
	var _fill_frac = clamp(_display_position, -1, 1);
	var _direction = 0;	// Anchored left, grow to the right
	var _c_max = O_WR_BAR_C_MAX_POS;
}
else
{
	var _display_position = -sqrt(-cur_position) + _bar_tip_x_offset;
	var _fill_frac = clamp(-(_display_position-_bar_tip_x_offset) - _bar_tip_x_offset, -1, 1);
	var _direction = 1;	// Anchored right, grow to the left
	var _c_max = O_WR_BAR_C_MAX_NEG;
}

var _c_bar = merge_color(O_WR_BAR_C_MIN, _c_max, _fill_frac);
if (_fill_frac>=0)
	var _c_frac = power(max(_fill_frac-2*O_WR_BAR_OSC_FX_MAG,0),1/4);
else
	var _c_frac = -power(-min(_fill_frac+2*O_WR_BAR_OSC_FX_MAG,0),1/4);
var _c_diamond = merge_color(O_WR_BAR_C_MIN, _c_max, _c_frac);

var _bar_tip_x = x + O_WR_BAR_X_HSIZE * _display_position;

// Draw the healthbar as a triangle
draw_set_color(_c_bar);
draw_set_alpha(1.0);
draw_primitive_begin(pr_trianglelist);
draw_vertex(_bar_tip_x, y+O_WR_BAR_Y_MID+1 + _bar_tip_y_offset);
draw_vertex(x,          y+O_WR_BAR_Y_MIN+1);
draw_vertex(x,          y+O_WR_BAR_Y_MAX+1);
draw_primitive_end();
draw_set_alpha(1);

// Draw static elements on top of the healthbar

// Centre line
draw_set_color(O_WR_CLINE_C);
draw_set_alpha(O_WR_CLINE_ALPHA);
draw_line_width(x-O_WR_CLINE_WIDTH/2+1, y+O_WR_BAR_Y_MIN, x-O_WR_CLINE_WIDTH/2+1, y+O_WR_BAR_Y_MAX, O_WR_CLINE_WIDTH);

// Centre diamond
draw_set_color(_c_diamond);
draw_set_alpha(O_WR_DIAM_ALPHA);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x - O_WR_DIAM_HWIDTH, y+O_WR_BAR_Y_MID);
draw_vertex(x,            y+O_WR_BAR_Y_MID - O_WR_DIAM_HHEIGHT);
draw_vertex(x,            y+O_WR_BAR_Y_MID + O_WR_DIAM_HHEIGHT);
draw_vertex(x + O_WR_DIAM_HWIDTH, y+O_WR_BAR_Y_MID);
draw_primitive_end();

// Centre diamond outline
draw_set_color(O_WR_CLINE_C);
draw_set_alpha(O_WR_CLINE_ALPHA);
draw_line_width(x - O_WR_DIAM_HWIDTH-1, y+O_WR_BAR_Y_MID-1,            x-1,            y+O_WR_BAR_Y_MID - O_WR_DIAM_HEIGHT/2-1, O_WR_OLINE_WIDTH);
draw_line_width(x-1,            y+O_WR_BAR_Y_MID - O_WR_DIAM_HEIGHT/2-1, x + O_WR_DIAM_HWIDTH-1, y+O_WR_BAR_Y_MID-1,            O_WR_OLINE_WIDTH);
draw_line_width(x + O_WR_DIAM_HWIDTH-1, y+O_WR_BAR_Y_MID-1,            x-1,            y+O_WR_BAR_Y_MID + O_WR_DIAM_HEIGHT/2-1, O_WR_OLINE_WIDTH);
draw_line_width(x-1,            y+O_WR_BAR_Y_MID + O_WR_DIAM_HEIGHT/2-1, x - O_WR_DIAM_HWIDTH-1, y+O_WR_BAR_Y_MID-1,            O_WR_OLINE_WIDTH);

// Reset drawing color and alpha
draw_set_color(c_black);
draw_set_alpha(1);