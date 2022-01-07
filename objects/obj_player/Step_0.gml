/// @description Handle motion and timers

// Skip all processing if the player is paused
if (not global.player_move)
{
	return;
}

// Decrease flash time
if (flash_time > 0)
	flash_time--;

// Get values for control. If not controllable, set all to false
if(global.player_control)
{
	key_left = key_down_left();
	key_right = key_down_right();
	key_jump = key_down_confirm() || key_down_up();
	key_run = key_down_cancel();
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
	key_run = 0;
}

// Calculate maximum speed boost due to glitterishness

var glitter_affect_walk = false; // Toggle to test if it's better to have glitterishness affect walk speed or not
var glitter_affect_jump = 0.5; // Toggle to vary how much glitterishness affects jump height

var glitter_boost = 1 + obj_game.glitterishness/100;
var jump_glitter_boost = 1 + obj_game.glitterishness/100*glitter_affect_jump;

var max_run_speed = global.RUN_SPEED * glitter_boost;
var min_run_air_speed = global.MIN_RUN_AIR_SPEED * glitter_boost;
var max_run_air_speed = global.MAX_RUN_AIR_SPEED * glitter_boost;

if (glitter_affect_walk)
{
	var max_walk_speed = global.WALK_SPEED * glitter_boost;
	var min_idle_air_speed = global.MIN_IDLE_AIR_SPEED * glitter_boost;
	var max_idle_air_speed = global.MAX_IDLE_AIR_SPEED * glitter_boost;
	var min_walk_air_speed = global.MIN_WALK_AIR_SPEED * glitter_boost;
	var max_walk_air_speed = global.MAX_WALK_AIR_SPEED * glitter_boost;
} else {
	var max_walk_speed = global.WALK_SPEED;
	var min_idle_air_speed = global.MIN_IDLE_AIR_SPEED;
	var max_idle_air_speed = global.MAX_IDLE_AIR_SPEED;
	var min_walk_air_speed = global.MIN_WALK_AIR_SPEED;
	var max_walk_air_speed = global.MAX_WALK_AIR_SPEED;
}

// Horizontal motion

// Check keypresses to determine desired direction of motion
var dir = key_right - key_left;

// Get the current direction of motion before any adjustments, and ensure not 0
last_dir = current_dir;
current_dir = sign(hsp);
if (current_dir==0)
{
	current_dir = last_dir;
}

// Separate handling depending on jump state
switch jump_state
{
case JumpState.GROUND:
	// Land state and ground state have similar ground controls, with the only exception being
	// that ground state allows instant turn-around in walk state
	
	// If we're in walk state and flipping direction, start by setting horizontal speed to zero
	if (dir != current_dir) and (move_state==MoveState.WALK)
	{		
		hsp = 0;
	}
	
	// Pass through to JumpState.LAND state, which handles the rest of horizontal ground controls
case JumpState.LAND:

	if (dir != 0)
	{
	
		// We're moving, so set walk state if we were in idle state
		if (move_state==MoveState.IDLE)
		{
			set_move_state_walk(dir);
		}
	
		if (move_state==MoveState.WALK)
		{
			// Accelerate
			hsp += dir*global.WALK_ACCEL;
		
			// If we exceed maximum walk speed and tab is held, switch to run state
			if (hsp > max_walk_speed) or (hsp < -max_walk_speed)
			{
				if (key_run)
				{
					set_move_state_run(dir);
				}
				else
				{
					// Tab not held, so decelerate toward maximum walk speed
					hsp -= dir*global.RUN_DECEL;
					if (hsp > max_walk_speed)
					{
						hsp = max_walk_speed;
					}
					else if (hsp < -max_walk_speed)
					{
						hsp = -max_walk_speed;
					}
					set_move_state_walk(dir);
				}
			}
			else if (dir != current_dir)
			{		
				// Flip the sprite if direction changes
				set_move_state_walk(dir);
			}
		}
		else // move_state==MoveState.RUN
		{
			
			// Check if we're still holding the run key
			if (key_run)
			{
				// Use accel based on whether we're accelerating or decelerating
				if (dir==current_dir)
				{
					var haccel = global.RUN_ACCEL;
				} else {
					var haccel = global.RUN_DECEL;	
				}
				
		
				if (hsp > max_run_speed)
				{
					// Decelerate to maximum run speed
					hsp -= global.RUN_DECEL;
					if (hsp < max_run_speed)
					{
						hsp = max_run_speed;
					}
				}
				else if (hsp < -max_run_speed)
				{
					// Decelerate to maximum run speed
					hsp += global.RUN_DECEL;
					if (hsp > -max_run_speed)
					{
						hsp = -max_run_speed;
					}
				}
				else
				{
					// Accelerate up to maximum run speed
					hsp += dir*haccel;
					if (hsp > max_run_speed)
					{
						hsp = max_run_speed;
					}
					else if (hsp < -max_run_speed)
					{
						hsp = -max_run_speed;
					}
				}
			
				// Flip the sprite if direction changes
				if (dir != current_dir)
				{		
					set_move_state_run(dir);
				}
			}
			else // Run key not held
			{
				// Tab not held, so decelerate toward maximum walk speed
				hsp -= dir*global.RUN_DECEL;
				if (hsp > max_walk_speed)
				{
					hsp = max_walk_speed;
					set_move_state_walk(dir);
				}
				else if (hsp < -max_walk_speed)
				{
					hsp = -max_walk_speed;
					set_move_state_walk(dir);
				}
			}
		}
	
	} else {
	
		if (move_state==MoveState.RUN)
		{
			// If running, decelerate to 0
			var haccel = -current_dir*global.RUN_DECEL;
			hsp += haccel;
			
			// Check if we've decelerated past 0, and if so, set speed to 0
			if (hsp*current_dir<0)
			{
				hsp = 0;	
			}
		} else {
			// If walking or idle, set horizontal speed to 0
			hsp = 0;
		}
	
		// If we're not moving, set move state to idle
		if (hsp==0)
		{
			set_move_state_idle();
		}
	}
	break;
	
// The remaining states all have air controls, so we pass through to use one block for all
case JumpState.JUMP:
case JumpState.RISE:
case JumpState.FALL:
case JumpState.GROUND_COYOTE:
case JumpState.LAND_COYOTE:

	// Check if we're accelerating or not
	if (dir != 0)
	{
		// Get acceleration based on current move state
		switch move_state
		{
		case MoveState.IDLE:
			var haccel = global.IDLE_AIR_ACCEL;
			var min_air_speed = min_idle_air_speed;
			var max_air_speed = max_idle_air_speed;
			break;
		case MoveState.WALK:
			var haccel = global.WALK_AIR_ACCEL;
			var min_air_speed = min_walk_air_speed;
			var max_air_speed = max_walk_air_speed;
			break;
		case MoveState.RUN:
			var haccel = global.RUN_AIR_ACCEL;
			var min_air_speed = min_run_air_speed;
			var max_air_speed = max_run_air_speed;
			break;
		default:
			// Shouldn't be hit, but just in case
			var haccel = global.IDLE_AIR_ACCEL;
			var min_air_speed = min_idle_air_speed;
			var max_air_speed = max_idle_air_speed;
		}
		
		hsp += dir*haccel;
		
		// Constrain to min and max speeds
		if (jump_dir * (hsp - max_air_speed) > 0)
		{
			hsp = jump_dir*max_air_speed;	
		}
		else if (jump_dir * (hsp - min_air_speed) < 0)
		{
			hsp = jump_dir*min_air_speed;	
		}
		
	}
}

// Horizontal collision check

var hcollide = false;
var slope_up = false;
var slope_down = false;


if (hsp!=0)
{
	// Check collision to the side
	if (obj_or_tile_meeting(x+hsp, y))
	{
		// Check for an upward slope
		if ((!obj_or_tile_meeting(x+hsp, y-2*abs(hsp))) and
	        ((jump_state==JumpState.GROUND) or (jump_state==JumpState.LAND)))
		{
			// Slow down and move up
			hsp *= global.SLOPE_UP_FACTOR;
			y -= 1*abs(hsp);
			slope_up = true;
		}
		else
		{
			hcollide = true;
		
			// Move as close as possible to the object
			var dx = 1*sign(hsp);
			var loop_count = 0;
			while (!obj_or_tile_meeting(x+dx, y))
			{
				x += dx;
				loop_count += 1;
				if (loop_count > abs(hsp)) {
					// Something's gone wrong with collision detection, so break out to avoid an infinite loop
					break;
				}
			}
		
			hsp = 0;
		}
	}
	else
	{
		// Check for going down a slope	
		if (!obj_or_tile_meeting(x+2*sign(hsp), y+1) and obj_or_tile_meeting(x+2*sign(hsp), y+3) and
	        ((jump_state==JumpState.GROUND) or (jump_state==JumpState.LAND)))
		{
			// Speed up and move down along the slope
			hsp *= global.SLOPE_DOWN_FACTOR;
			var loop_count = 0
			var dy = 1;
			slope_down = true;
			var init_y = y;
			while !(obj_or_tile_meeting(x+hsp, y+dy))
			{
				y += dy;
				loop_count += 1;
				if loop_count > 50 {
					// If we get here, something's gone wrong with slope detection. Revert y and let the player fall
					y = init_y;
					break;
				}
			}
		}
	}
}
	
// If we collide in either direction
if (hcollide)
{
	// If we're grounded, set move state to walk
	if (jump_state==JumpState.GROUND)
	{
		if (dir!=0)
		{
			set_move_state_walk(dir);
		} else {
			set_move_state_walk(current_dir);
		}
				
	}
}

// Perform horizontal movement (if any)
x += hsp;

// Vertical motion

// Jumping
if key_jump
{
	var jump_factor = 1;
	var jump_sound = snd_player_jump;
	var jump_effect = obj_jump_effect;
	
	// Separate handling depending on current jump state
	switch jump_state
	{
	// Ignore space input if rising or falling
	case JumpState.RISE:
	case JumpState.FALL:
		break;
	// Start a (super) jump if in an appropriate state
	case JumpState.LAND:
	case JumpState.LAND_COYOTE:
		// If we're in a landing state, set for a super jump
		jump_factor *= global.SUPER_JUMP_FACTOR;
		jump_sound = snd_player_super_jump;
		jump_effect = obj_super_jump_effect;
	case JumpState.GROUND:
	case JumpState.GROUND_COYOTE:
		// Only start a jump if space was released during the last jump
		if !(space_released)
		{
			break;
		}
		vsp = jump_factor * global.JUMP_INIT_VSPEED;
		set_jump_state_jump();
		audio_play_sound(jump_sound,1,false)
		instance_create_layer(x,y,"Effects_between",jump_effect)
		space_released = false;
		coyote_time = 0;
		break;
	// In jump state, add jump acceleration each frame
	case JumpState.JUMP:
		if (key_run)
			vsp += global.JUMP_VACCEL*jump_glitter_boost;
		else
			vsp += global.JUMP_VACCEL;
		break;
	default:
		break;
	}
	
} else {
	space_released = true;	
}

// Gravity - different gravity depending on if rising or falling
if (vsp<0)
{
	vsp += global.GRAVITY_RISE_VACCEL;
} else {
	vsp += global.GRAVITY_FALL_VACCEL;
}

// Vertical collision check

var land = false;

if (vsp>0)
{
	// Check collision downward
	if (obj_or_tile_meeting(x, y+vsp))
	{
		
		// Check for right-stickiness issue
		if ((jump_state!=JumpState.GROUND) and (jump_state!=JumpState.LAND) and !obj_or_tile_meeting(x-1, y+vsp))
		{
			x -= 1;
		}
		else
		{
			// Land on the surface
			land = true;
		
			// Move as close as possible to the object
			var dy = 1;
			var loop_count = 0
			while !(obj_or_tile_meeting(x, y+dy))
			{
				y += dy;
				loop_count += 1;
				if (loop_count > abs(vsp)) {
					// Something's gone wrong with collision detection, so break out to avoid an infinite loop
					break;
				}
			}
		
			vsp = 0;
		}
	}
	
	// TODO - check for place_meeting(x, y+vsp, obj_parent_d_collide)
}
else if (vsp<0)
{
	
	// Check collision above
	if (obj_or_tile_meeting(x, y+vsp))
	{
		
		// Check for right-stickiness issue
		if ((jump_state!=JumpState.GROUND) and (jump_state!=JumpState.LAND) and !obj_or_tile_meeting(x-1, y+vsp))
		{
			x -= 1;
		}
		else
		{
			// Move as close as possible to the object
			var dy = -1;
			var loop_count = 0
			while !(obj_or_tile_meeting(x, y+dy))
			{
				y += dy;
				loop_count += 1;
				if (loop_count > abs(vsp)) {
					// Something's gone wrong with collision detection, so break out to avoid an infinite loop
					break;
				}
			}
			vsp = 0;
		}
	}
}
	
// If we land
if (land)
{
	
	// If we're falling, set jump state to landing and play sound
	if ((jump_state==JumpState.JUMP) or (jump_state==JumpState.RISE) or (jump_state==JumpState.FALL))
	{
		audio_play_sound(snd_player_land,1,false)
		set_jump_state_land();
		update_player_sprite(dir);
	}
}

// Perform vertical movement (if any)
y += vsp;

// Decrement timer if jump state
if (jump_state==JumpState.JUMP)
{
	if (jump_time>0)
	{
		jump_time -= 1;
	}
	else
	{
		// When jump time hits 0, switch to rise state
		set_jump_state_rise()
	}
}

// Decrement timer if land state
if ((jump_state==JumpState.LAND) or (jump_state==JumpState.LAND_COYOTE))
{
	if (land_time>0)
	{
		land_time -= 1;
	}
	else
	{
		// When land time hits 0, switch to ground state
		if (jump_state==JumpState.LAND)
		{
			set_jump_state_ground();
		} else {
			set_jump_state_land_coyote();
		}
		update_player_sprite(dir);
	}
}

// Decrement timer if coyote state
if ((jump_state==JumpState.GROUND_COYOTE) or (jump_state==JumpState.LAND_COYOTE))
{
	if (coyote_time>0)
	{
		coyote_time -= 1;
	}
	else
	{
		// When coyote time hits 0, switch to fall state
		set_jump_state_fall();
	}
}

// Switch to fall or coyote state if we've started falling
if (vsp>0) and (!slope_up) and (!slope_down)
{
	// From jump or rise state, go to fall state
	if ((jump_state==JumpState.JUMP) or (jump_state==JumpState.RISE))
	{
		set_jump_state_fall();
	}
	// From ground state, go to ground coyote state
	else if (jump_state==JumpState.GROUND)
	{
		set_jump_state_ground_coyote();
	}
	// From ground state, go to ground coyote state
	else if (jump_state==JumpState.LAND)
	{
		set_jump_state_land_coyote();
	}
}

// Check for if we've somehow gotten stuck within a collidable object
if (obj_or_tile_meeting(x, y))
{
	// Find the quickest way to get unstuck
	var d = 1;
	while (obj_or_tile_meeting(x-d, y) and 
	       obj_or_tile_meeting(x, y-d) and 
	       obj_or_tile_meeting(x, y+d) and 
	       obj_or_tile_meeting(x+d, y))
	{
		d += 1;
	}
	
	// Check which direction we should move, then move that way
	if (!obj_or_tile_meeting(x-d, y))
	{
		x -= d;
	}
	else if (!obj_or_tile_meeting(x, y-d))
	{
		y -= d;	
	}
	else if (!obj_or_tile_meeting(x, y+d))
	{
		y += d;	
	}
	else if (!obj_or_tile_meeting(x+d, y))
	{
		x += d;	
	}
}