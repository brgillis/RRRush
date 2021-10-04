/// @description Check for level completion

if (obj_player.x >= x)
{
	// Mark level as complete to control how other objects behave
	obj_game.level_complete = true;
	
	// Check for new high score
	if ((obj_game.best_time_frames < 0) or (obj_game.time_frames < obj_game.best_time_frames))
	{
		// Update the best time
		obj_game.best_time_frames = obj_game.time_frames;
		
		// Update the display of the time and best time
		obj_gui_time_frame.value_c1 = $A0A0FF;
		obj_gui_time_frame.value_c2 = $7070FF;
		obj_gui_time_frame.value_c3 = $4040FF;
		obj_gui_time_frame.value_c4 = $7070FF;
		
		obj_gui_best_time_frame.value = get_time_string(obj_game.best_time_frames);
		obj_gui_best_time_frame.value_c1 = $10FF10;
		obj_gui_best_time_frame.value_c2 = $00FF00;
		obj_gui_best_time_frame.value_c3 = $00D000;
		obj_gui_best_time_frame.value_c4 = $00FF00;
		
		// Update the temporary best time variable
		global._tmp_best_time_frames = obj_game.best_time_frames;
	}
	
	
	// Level completion code
	
	// Stop player control of movement
	global.player_control = false;
}