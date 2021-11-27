/// @description Initialize idle on the ground

move_state = MoveState.IDLE;
jump_state = JumpState.GROUND;

// Initial speeds
hsp = 0;
vsp = 0;

// Timers for specific states
flash_time = 0;
jump_time = 0;
land_time = 0;
coyote_time = 0;

// Check for if spacebar has been released
space_released = true;

// Directions
current_dir = 1;
jump_dir = 1;