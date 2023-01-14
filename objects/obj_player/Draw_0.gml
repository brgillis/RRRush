/// @description Handle player effects


// If in overload state, emit glitter
if (global.game_state==GameState.OVERLOAD)
{
	var _f_glitter = power(obj_game.glitterishness/global.GLITTER_MAX, 2);
	burst_radial(obj_game.particle_system_between, x, y-52, obj_persistent.glitter_collect,
	             10*_f_glitter, 40)	
}

switch flash_time
{
case 1: case 2: case 8:
	shader_set(sh_flash_mild);
	break;
case 3: case 4: case 7:
	shader_set(sh_flash_med);
	break;
case 5: case 6:
	shader_set(sh_flash_strong);
	break;
case 0:
	if (global.game_state==GameState.OVERLOAD)
	{

		// Play repeated sound and flash
		audio_play_sound(snd_overload, 2, false, 0.5, 0, 0.5+0.5*_f_glitter);	
		flash_time = 12;
	}
default:
	break;
}

draw_self();
shader_reset();