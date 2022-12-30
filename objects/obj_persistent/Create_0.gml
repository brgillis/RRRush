/// @description Set defaults for values stored through transitions

// Define an enum for ways to transition between rooms
enum TransMode
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

// Initialize transition mode and variables related to transitions
mode = TransMode.INTRO;
percent = 1;
target = room;

// Data that will be kept between room transitions
world_index = -1;
world_number = -1;
stage_index = -1;
stage_number = -1;
best_time_frames = 0;

// Define an update function for when triggering room transitions
function room_transition(_mode, _target_room=-1){
	/// @desc Transition to a desired room
	/// @arg mode sets transition mode TransMode between NEXT, GOTO, and RESTART
	/// @arg target_room sets target room (if using GOTO mode)

	// Set up for a transition
	mode = _mode;
	target = _target_room;
	
	// Calculate any member variables for the new room
	world_number = get_world_number(world_index);
	stage_number = get_stage_number(stage_index);
	
	// Get the best time for the target room
	if (world_index>=WorldSelectOption.WORLD_8 and stage_index>=0)
		best_time_frames = global.LL_BEST_TIME_FRAMES[world_index][stage_index];
	else
		best_time_frames = 0;
}

function update_best_time(_new_best_time_frames, _force=false)
{
	// Check to ensure the new time is better
	if (not _force)
	{
		if (best_time_frames<_new_best_time_frames and best_time_frames>0)
		{
			debug_message("ERROR: Trying to update best time (", get_time_string(best_time_frames),
			              ") with worse time (", get_time_string(_new_best_time_frames), ").",
			              "If this is intentional, set _force=true.");
			exit;
		}
		if (global.LL_BEST_TIME_FRAMES[world_index][stage_index]<_new_best_time_frames and
		    global.LL_BEST_TIME_FRAMES[world_index][stage_index]>0)
		{
			debug_message("ERROR: Trying to update best time (", get_time_string(best_time_frames),
			              ") with worse time (", get_time_string(_new_best_time_frames), ").",
			              "If this is intentional, set _force=true.");
			exit;
		}
	}
	
	best_time_frames = _new_best_time_frames;
	global.LL_BEST_TIME_FRAMES[world_index][stage_index] = _new_best_time_frames;
}