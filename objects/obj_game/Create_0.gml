/// @description Init for each level

// Init variables

time_frames = 0;
puffs_collected = 0;
glitterpuffs_collected = 0;
glitterishness = 0;
level_complete = false;

best_time_frames = global._tmp_best_time_frames;

// Set up the particle system

particle_system_between = part_system_create_layer("Effects_between", 0);
particle_system_gui = part_system_create_layer("Effects_gui", 0);

glitter_collect = part_type_create();
glitter_gui = part_type_create();
glitter_collect_flash = part_type_create();
glitter_gui_flash = part_type_create();

glitter_particles = [glitter_collect, glitter_gui, glitter_collect_flash, glitter_gui_flash]

// Set properties unique to each type

part_type_sprite(glitter_collect, spr_particle_pink, false, false, true);
part_type_speed(glitter_collect, 4, 8, -0.1, 0);

part_type_sprite(glitter_gui, spr_particle_blue, false, false, true);
part_system_automatic_draw(glitter_gui, false); // Need to manually draw on GUI layer
part_type_speed(glitter_gui, 1, 12, -0.1, 0.1);

part_type_speed(glitter_collect_flash, 1, 2, -0.1, 0.1);

part_system_automatic_draw(glitter_gui_flash, false); // Need to manually draw on GUI layer
part_type_speed(glitter_gui_flash, 1, 2, -0.1, 0.1);

// Set properties common to basic glitter types

for(var i=0; i<2; ++i)
{
	particle = glitter_particles[i]

	part_type_life(particle, 10, 15);
	part_type_direction(particle, 0, 360, 0, 30);
	part_type_gravity(particle, 0.3, 270);
	part_type_alpha3(particle, 1, 1, 0.5);
	part_type_colour_rgb(particle, 125, 255, 125, 255, 125, 255);
	part_type_step(particle,-5,glitter_particles[i+2]);
	part_type_size(particle, 0.05, 0.1, 0.01, 0.005);
}

// Set properties common to flash glitter types

for(var i=2; i<4; ++i)
{
	particle = glitter_particles[i]

	part_type_shape(particle, pt_shape_spark);
	part_type_life(particle, 2, 2);
	part_type_direction(particle, 0, 360, 0, 0);
	part_type_gravity(particle, 0.3, 270);
	part_type_alpha3(particle, 1, 1, 1);
	part_type_blend(particle, true);
	part_type_size(particle, 0.1, 0.15, 0.01, 0.005);
	
}

// Set properties common to all glitter types

for(var i=0; i<4; ++i)
{
	particle = glitter_particles[i]
	
	part_type_orientation(particle, 0, 360, 15, 60, true);
	
}