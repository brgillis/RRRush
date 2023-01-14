/// @description Draw particles

// Steady stream of glitter once title is fully visible
if (text_glitter)
	burst_rect(particle_system_gui, glitter_x_min, glitter_x_max, glitter_y_min, glitter_y_max,
		       obj_persistent.glitter_collect, 0.25);

part_system_drawit(particle_system_gui);
