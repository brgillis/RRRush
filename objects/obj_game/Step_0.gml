/// @description Update globals

// Set game state to active at end of transition in
if (fade_in)
{
	if (obj_persistent.percent<=0.3)
	{
		set_game_state_active();
		fade_in = false; // Set to false so we only set to active once, at the beginning
	}
}
// Pause the game if the pause button is pressed
else if ((global.game_state == GameState.ACTIVE) or (global.game_state == GameState.NO_CONTROL)
     or (global.game_state == GameState.OVERLOAD)) and (key_pressed_pause())
{
	var old_game_state = global.game_state;
	instance_create_layer(0,0,"Instances",obj_pause_menu);
	obj_pause_menu.old_game_state = old_game_state;
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
		if (obj_player.key_run)
		{
			var _glitter_decay = global.GLITTER_DECAY_RUN;
		}
		else if (obj_player.move_state == MoveState.IDLE)
		{
			var _glitter_decay = global.GLITTER_DECAY_IDLE;	
		}
		else
		{
			var _glitter_decay = global.GLITTER_DECAY_WALK;
		}
		
		// Apply overload modifier if in overload state
		if global.game_state==GameState.OVERLOAD
			_glitter_decay *= global.GLITTER_OVERLOAD_FACTOR;
		
		glitterishness -= _glitter_decay;
	}

	// Clamp glitterishness within bounds, and handle overload
	if (glitterishness >= global.GLITTER_MAX)
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