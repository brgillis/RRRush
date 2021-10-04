/// @description Handle motion and timers

// Decrease flash time
if (flash_time > 0)
	flash_time--;

// Get values for control. If not controllable, set all to false
if(global.player_control)
{
	var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	var key_jump = keyboard_check(vk_space) || keyboard_check(ord("W")) || mouse_check_button(mb_left);
	var key_run = keyboard_check(vk_tab) || keyboard_check(vk_shift) || mouse_check_button(mb_right);
}
else
{
	var key_left = 0;
	var key_right = 0;
	var key_jump = 0;
	var key_run = 0;
}

// Calculate maximum speed boost due to glitterishness

var glitter_boost = 1 + obj_game.glitterishness/100;

var max_walk_speed = global.walk_speed * glitter_boost;
var max_run_speed = global.run_speed * glitter_boost;
var min_idle_air_speed = global.min_idle_air_speed * glitter_boost;
var max_idle_air_speed = global.max_idle_air_speed * glitter_boost;
var min_walk_air_speed = global.min_walk_air_speed * glitter_boost;
var max_walk_air_speed = global.max_walk_air_speed * glitter_boost;
var min_run_air_speed = global.min_run_air_speed * glitter_boost;
var max_run_air_speed = global.max_run_air_speed * glitter_boost;

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
case player_ground:
	// Land state and ground state have similar ground controls, with the only exception being
	// that ground state allows instant turn-around in walk state
	
	// If we're in walk state and flipping direction, start by setting horizontal speed to zero
	if (dir != current_dir) and (move_state==player_walk)
	{		
		hsp = 0;
	}
	
	// Pass through to player_land state, which handles the rest of horizontal ground controls
case player_land:

	if (dir != 0)
	{
	
		// We're moving, so set walk state if we were in idle state
		if (move_state==player_idle)
		{
			set_move_state_walk(dir);
		}
	
		if (move_state==player_walk)
		{
			// Accelerate
			hsp += dir*global.walk_accel;
		
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
					hsp -= dir*global.run_decel;
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
		else // move_state==player_run
		{
			
			// Check if we're still holding the run key
			if (key_run)
			{
				// Use accel based on whether we're accelerating or decelerating
				if (dir==current_dir)
				{
					var haccel = global.run_accel;
				} else {
					var haccel = global.run_decel;	
				}
				
		
				if (hsp > max_run_speed)
				{
					// Decelerate to maximum run speed
					hsp -= global.run_decel;
					if (hsp < max_run_speed)
					{
						hsp = max_run_speed;
					}
				}
				else if (hsp < -max_run_speed)
				{
					// Decelerate to maximum run speed
					hsp += global.run_decel;
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
				hsp -= dir*global.run_decel;
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
	
		if (move_state==player_run)
		{
			// If running, decelerate to 0
			var haccel = -current_dir*global.run_decel;
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
case player_jump:
case player_rise:
case player_fall:
case player_ground_coyote:
case player_land_coyote:

	// Check if we're accelerating or not
	if (dir != 0)
	{
		// Get acceleration based on current move state
		switch move_state
		{
		case player_idle:
			var haccel = global.idle_air_accel;
			var min_air_speed = min_idle_air_speed;
			var max_air_speed = max_idle_air_speed;
			break;
		case player_walk:
			var haccel = global.walk_air_accel;
			var min_air_speed = min_walk_air_speed;
			var max_air_speed = max_walk_air_speed;
			break;
		case player_run:
			var haccel = global.run_air_accel;
			var min_air_speed = min_run_air_speed;
			var max_air_speed = max_run_air_speed;
			break;
		default:
			// Shouldn't be hit, but just in case
			var haccel = global.idle_air_accel;
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
	        ((jump_state==player_ground) or (jump_state==player_land)))
		{
			// Slow down and move up
			hsp *= global.slope_up_factor;
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
	        ((jump_state==player_ground) or (jump_state==player_land)))
		{
			// Speed up and move down along the slope
			hsp *= global.slope_down_factor;
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
	if (jump_state==player_ground)
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
	case player_rise:
	case player_fall:
		break;
	// Start a (super) jump if in an appropriate state
	case player_land:
	case player_land_coyote:
		// If we're in a landing state, set for a super jump
		jump_factor *= global.super_jump_factor;
		jump_sound = snd_player_super_jump;
		jump_effect = obj_super_jump_effect;
	case player_ground:
	case player_ground_coyote:
		// Only start a jump if space was released during the last jump
		if !(space_released)
		{
			break;
		}
		vsp = jump_factor * global.jump_init_vspeed;
		set_jump_state_jump();
		audio_play_sound(jump_sound,1,false)
		instance_create_layer(x,y,"Effects_between",jump_effect)
		space_released = false;
		coyote_time = 0;
		break;
	// In jump state, add jump acceleration each frame
	case player_jump:
		vsp += global.jump_vaccel;
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
	vsp += global.gravity_rise_vaccel;
} else {
	vsp += global.gravity_fall_vaccel;
}

// Vertical collision check

var land = false;

if (vsp>0)
{
	// Check collision downward
	if (obj_or_tile_meeting(x, y+vsp))
	{
		
		// Check for right-stickiness issue
		if ((jump_state!=player_ground) and (jump_state!=player_land) and !obj_or_tile_meeting(x-1, y+vsp))
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
		if ((jump_state!=player_ground) and (jump_state!=player_land) and !obj_or_tile_meeting(x-1, y+vsp))
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
	if ((jump_state==player_jump) or (jump_state==player_rise) or (jump_state==player_fall))
	{
		audio_play_sound(snd_player_land,1,false)
		set_jump_state_land();
		update_player_sprite(dir);
	}
}

// Perform vertical movement (if any)
y += vsp;

// Decrement timer if jump state
if (jump_state==player_jump)
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
if ((jump_state==player_land) or (jump_state==player_land_coyote))
{
	if (land_time>0)
	{
		land_time -= 1;
	}
	else
	{
		// When land time hits 0, switch to ground state
		if (jump_state==player_land)
		{
			set_jump_state_ground();
		} else {
			set_jump_state_land_coyote();
		}
		update_player_sprite(dir);
	}
}

// Decrement timer if coyote state
if ((jump_state==player_ground_coyote) or (jump_state==player_land_coyote))
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
	if ((jump_state==player_jump) or (jump_state==player_rise))
	{
		set_jump_state_fall();
	}
	// From ground state, go to ground coyote state
	else if (jump_state==player_ground)
	{
		set_jump_state_ground_coyote();
	}
	// From ground state, go to ground coyote state
	else if (jump_state==player_land)
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