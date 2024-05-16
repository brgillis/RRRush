/// @description Handle player effects


// If in overload state, emit glitter
if (global.game_state==GameState.OVERLOAD)
{
	var _f_glitter = power(obj_game.glitterishness/global.GLITTER_MAX, 2);
	burst_radial(obj_game.particle_system_between, x, y-52, obj_persistent.glitter_collect,
	             10*_f_glitter, 40)	
}

// Play flash, and repeat if in overload state
set_flash_shader(flash_time, false, 0, 1, 1);
if (flash_time==0 and global.game_state==GameState.OVERLOAD) {
	// Play repeated sound and flash
	audio_play_sound(snd_overload, 2, false, 0.5, 0, 0.5+0.5*_f_glitter);	
	flash_time = 12;	
}

draw_self();
shader_reset();