/// @description Set label to be displayed

new_high_score = false;

// Define overloadable functions to get value, label, and colors thereof each step

function get_label() {
	label = "Time:";
}

function get_label_color() {
	label_c1 = $A0A0FF;
	label_c2 = $7070FF;
	label_c3 = $4040FF;
	label_c4 = $7070FF;
}

function get_value() {
	value = get_time_string(obj_game.time_frames, true);
}

function get_value_color() {
	if (!obj_game.level_complete)
	{
		if ((obj_persistent.best_time_frames > 0) and (obj_game.time_frames <= obj_persistent.best_time_frames))
		{
			value_c1 = $C0C0FF;
			value_c2 = $9090FF;
			value_c3 = $6060FF;
			value_c4 = $9090FF;
		}
		else
		{
			value_c1 = $6060FF;
			value_c2 = $3030FF;
			value_c3 = $0000FF;
			value_c4 = $3030FF;
		}
	}
	else if (new_high_score)
	{
		
		value_c1 = $A0A0FF;
		value_c2 = $7070FF;
		value_c3 = $4040FF;
		value_c4 = $7070FF;
	}
}