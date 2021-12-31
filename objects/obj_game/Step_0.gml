/// @description Update globals

// Set game state to active at end of transition in
if ((obj_persistent.percent==0) && (fade_in))
{
	set_game_state_active();
	fade_in = false; // Set to false so we only set to active once, at the beginning
}

// Update time in active and overload states
if ((global.game_state == GameState.ACTIVE) || (global.game_state == GameState.OVERLOAD))
{
	time_frames += 1;
}

// Update glitterishness when active or no control
if  ((global.game_state == GameState.ACTIVE) or (global.game_state == GameState.NO_CONTROL)
     or (global.game_state == GameState.OVERLOAD))
{

	// Modify glitterishness (for testing purposes)
	if (keyboard_check(ord("U")))
	{
		glitterishness += 1;
	}
	else if (keyboard_check(ord("J")))
	{
		glitterishness -= 1;
	}
	else
	{
		// Glitter decay, depending on move state
		if (obj_player.move_state == MoveState.IDLE)
		{
			_glitter_decay = global.GLITTER_DECAY_IDLE;	
		}
		else if (obj_player.move_state == MoveState.WALK)
		{
			_glitter_decay = global.GLITTER_DECAY_WALK;	
		}
		else
		{
			_glitter_decay = global.GLITTER_DECAY_RUN;	
		}
		
		// Apply overload modifier if in overload state
		if global.game_state==GameState.OVERLOAD
			_glitter_decay *= global.GLITTER_OVERLOAD_FACTOR
		
		glitterishness -= _glitter_decay;
	}

	// Clamp glitterishness within bounds, and handle overload
	if (glitterishness > global.GLITTER_MAX)
	{
		glitterishness = global.GLITTER_MAX;
		if (global.game_state == GameState.ACTIVE)
			set_game_state_overload();
	}
	else if (glitterishness < global.GLITTER_MIN)
	{
		glitterishness = global.GLITTER_MIN;
		if (global.game_state == GameState.OVERLOAD)
			set_game_state_active();
	}
	
}