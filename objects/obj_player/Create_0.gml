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

// Variables to allow forced inputs if set to true (will be set to false the frame after used)
function clear_forced_inputs() {
	force_key_left = false;
	force_key_right = false;
	force_key_jump = false;
	force_key_run = false;
}

clear_forced_inputs();

function burst_anim(_target=self, _n_part=30) {

	// Burst glitter particles
	part_particles_create(obj_game.particle_system_between, _target.x, _target.y, obj_persistent.glitter_collect, _n_part);

	// Flash the player white
	flash_time = 8;

	// Play sound
	audio_play_sound(snd_puff_collect, 2, false);	
}