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
			   
var f_glitter = leftover_glitter + global.glitter_rate*power(obj_game.glitterishness/100, global.glitter_power);

var n_glitter = floor(f_glitter);

leftover_glitter = f_glitter - n_glitter;

// Determine a random point on the glitter bar to spawn particles this frame
var bar_max_x = min_x+(max_x-min_x)*obj_game.glitterishness/100;
for(i=0; i<n_glitter; i++)
{
	var particle_x_source = random_range(min_x,
	                                     bar_max_x);
	var particle_y_source = random_range(min_y,
	                                     max_y);

	part_particles_create(obj_game.particle_system_gui,
						  particle_x_source,
						  particle_y_source,
						  obj_game.glitter_gui,
						  1);
}
					  
// Draw particles on the GUI layer
part_system_drawit(obj_game.particle_system_gui);