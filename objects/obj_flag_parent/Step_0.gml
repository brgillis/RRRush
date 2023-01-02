/// @description Check for Alevel completion

#macro CYCLE_SEC (1.60145/4)
#macro OFFSET 1.35594
#macro FADE_TIME_MS 200
#macro JUMP_DELAY_FRAMES 60
#macro MAX_WAIT_FRAMES 120

if (obj_player.x < x)
	exit;

// Keep track of wait so we can escape eventually if something goes wrong
var _i = 0;
// Code for subsequent frames after completion
if (stage_complete and not music_complete)
{
	_i++;
	
	// Wait until music hits the proper point
	var _music_time = audio_sound_get_track_position(obj_game.game_music);
	var _cycle_pos = (_music_time - OFFSET)/CYCLE_SEC;
	
	// Check if we're within one frame of the point to switch over tracks
	if (_i > MAX_WAIT_FRAMES) or ((_cycle_pos - floor(_cycle_pos))*CYCLE_SEC <= 2/60) 
	{
		// Fade out the music and fade in the ending sound
		audio_sound_gain(obj_game.game_music, 0, FADE_TIME_MS);
		var _music_end = audio_play_sound(msc_world_1_end, 1, false, 0);
		audio_sound_gain(_music_end, 1, FADE_TIME_MS);
		music_complete = true;
	}
}
else if (stage_complete and music_complete)
{	
	completion_frame++;
	
	// Sequence of events: Play completion sound, make player jump, make player super high jump,
	// load completion menu
	
	if (completion_frame==JUMP_DELAY_FRAMES)
	{
		obj_player.force_key_jump = true;	
	}
	else if (completion_frame>JUMP_DELAY_FRAMES+10 and completion_frame<JUMP_DELAY_FRAMES+50)
	{
		obj_player.force_key_jump = true;	
	}
	else if (completion_frame==JUMP_DELAY_FRAMES+60)
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
