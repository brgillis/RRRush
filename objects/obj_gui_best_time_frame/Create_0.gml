/// @description Set the label and value to be displayed

label = "Best:";
if (obj_persistent.best_time_frames > 0)
	value = get_time_string(obj_persistent.best_time_frames, true);
else
	value = ""
	
// Set label and value colors

label_c1 = $A0A0FF;
label_c2 = $7070FF;
label_c3 = $4040FF;
label_c4 = $7070FF;
	
value_c1 = $A0A0FF;
value_c2 = $7070FF;
value_c3 = $4040FF;
value_c4 = $7070FF;