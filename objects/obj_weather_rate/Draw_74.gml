/// @description Draw rate of glitter gain or loss

draw_self();

var _bar_x_size = 98;

var _min_y = y+15;
var _max_y = y+57;
var _mid_y = (_min_y + _max_y)/2;

var _bar_min_y = _min_y+1;
var _bar_max_y = _max_y+1;

var _bar_osc_fx_mag = 0.01;
var _bar_osc_x_period = 48;
var _bar_osc_x_offset = 3/4;

var _bar_osc_y_mag = 0.5;
var _bar_osc_y_period = 288;
var _bar_osc_y_offset = 2/4;

var _tside = 20;
var _talpha = 1.0;
var _theight = _tside/2;


// Calculate position of bar

var _c_min = #0000FF;

// Calculate what the current gain rate is, and set it as the target for the bar
target_position = obj_game.glitter_gain / obj_game.glitter_loss_max_mag

// Move current position toward target position
cur_position = fapproach(cur_position, target_position, 0.1, 0.02)

var _bar_tip_x_offset = wave_position(-_bar_osc_fx_mag, _bar_osc_fx_mag, obj_game.time_frames,
									  _bar_osc_x_period, _bar_osc_x_offset)
var _bar_tip_y_offset = wave_position(-_bar_osc_y_mag, _bar_osc_y_mag, obj_game.time_frames,
									  _bar_osc_y_period, _bar_osc_y_offset)

// Direction of bar depends on whether gaining or losing glitterishness
if (cur_position > 0)
{
	var _display_position = sqrt(cur_position) + _bar_tip_x_offset;
	var _fill_frac = clamp(_display_position, -1, 1);
	var _direction = 0;	// Anchored left, grow to the right
	var _c_max = #00FF00;
}
else
{
	var _display_position = -sqrt(-cur_position) + _bar_tip_x_offset;
	var _fill_frac = clamp(-(_display_position-_bar_tip_x_offset) - _bar_tip_x_offset, -1, 1);
	var _direction = 1;	// Anchored right, grow to the left
	var _c_max = #FF0000;
}

var _c_bar = merge_color(_c_min, _c_max, _fill_frac);
if (_fill_frac>=0)
	var _c_frac = power(max(_fill_frac-0.05,0),1/4);
else
	var _c_frac = -power(-min(_fill_frac+0.05,0),1/4);
var _c_diamond = merge_color(_c_min, _c_max, _c_frac);

var _bar_tip_x = x + _bar_x_size * _display_position;

// Draw the healthbar as a triangle
draw_set_color(_c_bar);
draw_set_alpha(_talpha);
draw_primitive_begin(pr_trianglelist);
draw_vertex(_bar_tip_x, _mid_y + _bar_tip_y_offset);
draw_vertex(x,          _bar_min_y);
draw_vertex(x,          _bar_max_y);
draw_primitive_end();
draw_set_alpha(1);

// Draw static elements on top of the healthbar

// Centre line
draw_set_color(c_black);
var _line_width = 4;
draw_line_width(x-_line_width/2+1, _min_y, x-_line_width/2+1, _max_y, _line_width);

// Centre diamond
draw_set_alpha(_talpha);
draw_set_color(_c_diamond);
draw_primitive_begin(pr_trianglestrip);
draw_vertex(x - _theight, _mid_y);
draw_vertex(x,            _mid_y - _tside/2);
draw_vertex(x,            _mid_y + _tside/2);
draw_vertex(x + _theight, _mid_y);
draw_primitive_end();

// Centre diamond outline
draw_set_color(c_black);
draw_set_alpha(1);
var _outline_width = 2;
draw_line_width(x - _theight-1, _mid_y-1,            x-1,            _mid_y - _tside/2-1, _outline_width);
draw_line_width(x-1,            _mid_y - _tside/2-1, x + _theight-1, _mid_y-1,            _outline_width);
draw_line_width(x + _theight-1, _mid_y-1,            x-1,            _mid_y + _tside/2-1, _outline_width);
draw_line_width(x-1,            _mid_y + _tside/2-1, x - _theight-1, _mid_y-1,            _outline_width);