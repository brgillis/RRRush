/// @description Draw current level of glitterishness

draw_self();

var min_x = x+12;
var max_x = x+207;
var min_y = y+15;
var max_y = y+57;

draw_healthbar(min_x, // x1
               min_y, // y1
			   max_x, // x2
			   max_y, // y2
			   obj_game.glitterishness, // amount
			   $00000000, // background color
			   $FFFF0000, // min color
			   $FF8080FF, // max color
			   0, // direction
			   false, // show background
			   true); // show border
			   
var f_glitter = leftover_glitter + global.GLITTER_PARTICLE_RATE*power(obj_game.glitterishness/global.GLITTER_MAX, global.GLITTER_PARTICLE_POWER);

var n_glitter = floor(f_glitter);

leftover_glitter = f_glitter - n_glitter;

// Determine a random point on the glitter bar to spawn particles this frame
var bar_max_x = min_x+(max_x-min_x)*obj_game.glitterishness/100;

burst_rect(obj_game.particle_system_gui, min_x, bar_max_x, min_y, max_y, obj_persistent.glitter_gui, n_glitter);
					  
// Draw particles on the GUI layer if not paused
if (global.game_state!=GameState.MENU)
	part_system_drawit(obj_game.particle_system_gui);