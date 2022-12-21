/// @description Set value to be displayed

value = get_time_string(obj_game.time_frames);

// Set color of value
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