/// @description Set defaults for values stored through transitions

// Define an enum for ways to transition between rooms
enum TransMode
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

// Initialize transition mode and variables related to transitions
mode = TransMode.INTRO;
percent = 1;
target = room;

// Data that will be kept between room transitions
world_index = -1;
world_number = -1;
stage_index = -1;
stage_number = -1;
best_time_frames = 0;
old_best_time_frames = best_time_frames;

// Set up the particles

glitter_collect = part_type_create();
glitter_gui = part_type_create();
glitter_collect_flash = part_type_create();
glitter_gui_flash = part_type_create();

var glitter_particles = [glitter_collect, glitter_gui, glitter_collect_flash, glitter_gui_flash]

// Set properties unique to each type

part_type_sprite(glitter_collect, spr_particle_pink, false, false, true);
part_type_speed(glitter_collect, 4, 8, -0.1, 0);

part_type_sprite(glitter_gui, spr_particle_blue, false, false, true);
part_type_speed(glitter_gui, 1, 12, -0.1, 0.1);

part_type_speed(glitter_collect_flash, 1, 2, -0.1, 0.1);

part_type_speed(glitter_gui_flash, 1, 2, -0.1, 0.1);

// Set properties common to basic glitter types

for(var i=0; i<2; ++i)
{
	var particle = glitter_particles[i]

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
	var particle = glitter_particles[i]

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
	var particle = glitter_particles[i]
	
	part_type_orientation(particle, 0, 360, 15, 60, true);
	
}

// Define an update function for when triggering room transitions
function room_transition(_mode, _target_room=-1, _music_index=-1) {
	/// @desc Transition to a desired room
	/// @arg mode sets transition mode TransMode between NEXT, GOTO, and RESTART
	/// @arg target_room sets target room (if using GOTO mode)

	// Set up for a transition
	mode = _mode;
	target = _target_room;
	
	// Calculate any member variables for the new room
	world_number = get_world_number(world_index);
	stage_number = get_stage_number(stage_index);
	
	// Get the best time for the target room
	if (world_index>=WorldSelectOption.WORLD_8 and stage_index>=0)
		best_time_frames = global.LL_BEST_TIME_FRAMES[world_index][stage_index];
	else
		best_time_frames = 0;
		
	if (_music_index>-1)
	{
		// Fade out all music with the provided time
		audio_sound_gain(_music_index, 0, 1000);
	}
}

function update_best_time(_new_best_time_frames, _force=false)
{
	// Check to ensure the new time is better
	if (not _force)
	{
		if (best_time_frames<_new_best_time_frames and best_time_frames>0)
		{
			debug_message("ERROR: Trying to update best time (", get_time_string(best_time_frames),
			              ") with worse time (", get_time_string(_new_best_time_frames), ").",
			              "If this is intentional, set _force=true.");
			exit;
		}
		if (global.LL_BEST_TIME_FRAMES[world_index][stage_index]<_new_best_time_frames and
		    global.LL_BEST_TIME_FRAMES[world_index][stage_index]>0)
		{
			debug_message("ERROR: Trying to update best time (", get_time_string(best_time_frames),
			              ") with worse time (", get_time_string(_new_best_time_frames), ").",
			              "If this is intentional, set _force=true.");
			exit;
		}
	}
	
	old_best_time_frames = best_time_frames;
	best_time_frames = _new_best_time_frames;
	global.LL_BEST_TIME_FRAMES[world_index][stage_index] = _new_best_time_frames;
}