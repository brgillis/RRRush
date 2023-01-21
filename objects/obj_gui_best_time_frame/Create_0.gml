/// @description Set the label and value to be displayed

new_high_score = false;

label = "Best:";
if (obj_persistent.best_time_frames > 0)
	base_value = get_time_string(obj_persistent.best_time_frames, true);
else
	base_value = ""
	
// Set label and value colors

label_c1 = $A0A0FF;
label_c2 = $7070FF;
label_c3 = $4040FF;
label_c4 = $7070FF;
	
value_c1 = $A0A0FF;
value_c2 = $7070FF;
value_c3 = $4040FF;
value_c4 = $7070FF;

// Overload functions to get value, label, and colors thereof each step

function get_label() {
	label = "Best:";
}

function get_label_color() {
	label_c1 = $A0A0FF;
	label_c2 = $7070FF;
	label_c3 = $4040FF;
	label_c4 = $7070FF;
}

function get_value() {
	value = base_value;
}

function get_value_color() {
	if (!new_high_score)
	{
		value_c1 = $A0A0FF;
		value_c2 = $7070FF;
		value_c3 = $4040FF;
		value_c4 = $7070FF;
	}
	else
	{
		value_c1 = $10FF10;
		value_c2 = $00FF00;
		value_c3 = $00D000;
		value_c4 = $00FF00;
	}
}