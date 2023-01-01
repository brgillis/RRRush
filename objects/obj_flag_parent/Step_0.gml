/// @description Check for level completion

if (obj_player.x < x)
	exit;

// Code for subsequent frames after completion
if (stage_complete)
{
	completion_frame++;
	
	// Sequence of events: Play completion sound, make player jump, make player super high jump,
	// load completion menu
	
	if (completion_frame==5)
	{
		audio_play_sound(snd_level_end, 1, false);	
	}
	else if (completion_frame==40)
	{
		obj_player.force_key_jump = true;	
	}
	else if (completion_frame>50 and completion_frame<90)
	{
		obj_player.force_key_jump = true;	
	}
	else if (completion_frame==100)
	{
		// Load the stage complete menu
		instance_create_layer(0, 0, "Instances", obj_stage_complete_menu);
	}
	
	exit;
}
	
// Code for first frame when level is completed
	
stage_complete = true;
completion_frame = 0;

// Mark level as complete to control how other objects behave
obj_game.level_complete = true;
	
// Check for new high score
if ((obj_persistent.best_time_frames <= 0) or (obj_game.time_frames < obj_persistent.best_time_frames))
{
	obj_persistent.update_best_time(obj_game.time_frames);
		
	// Update the display of the time and best time
	obj_gui_time_frame.value_c1 = $A0A0FF;
	obj_gui_time_frame.value_c2 = $7070FF;
	obj_gui_time_frame.value_c3 = $4040FF;
	obj_gui_time_frame.value_c4 = $7070FF;
		
	obj_gui_best_time_frame.value = get_time_string(obj_persistent.best_time_frames, true);
	obj_gui_best_time_frame.value_c1 = $10FF10;
	obj_gui_best_time_frame.value_c2 = $00FF00;
	obj_gui_best_time_frame.value_c3 = $00D000;
	obj_gui_best_time_frame.value_c4 = $00FF00;
}
	
// Stop player control of movement
set_game_state_stage_end();
