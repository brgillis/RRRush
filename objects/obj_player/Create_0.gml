/// @description Initialize idle on the ground

move_state = player_idle;
jump_state = player_ground;

// Initial speeds
hsp = 0;
vsp = 0;

// Timers for specific states
jump_time = 0;
land_time = 0;
coyote_time = 0;

// Check for if spacebar has been released
space_released = true;

// Directions
current_dir = 1;
jump_dir = 1;

// Set player scale
// image_xscale = 0.5
// image_yscale = 0.5