/// @description Init for each level

#macro FADE_IN_TIME_MS 1000

// Start without contol - control will be enabled after fade-in
set_game_state_no_control();

// Start playing music, fading it in
game_music = audio_play_sound(msc_world_1, 0, true, 0);
audio_sound_gain(game_music, 1, FADE_IN_TIME_MS);

// Init variables

time_frames = 0;
glitterpuffs_collected = 0;
level_complete = false;

fade_in = true; // Note at start we're fading in, so we can set game state to active only once

// Create particle systems we'll be using
particle_system_between = part_system_create_layer("Effects_between", 0);
particle_system_gui = part_system_create_layer("Effects_gui", 0);
part_system_automatic_draw(particle_system_gui, false); // Need to manually draw on GUI layer

// Variables and functions related to glitterishness

enum WeatherState {
	RAINBOW = 0,
	SUNNY = 1,
	CLOUDY = 2,
	RAINY = 3
}

glitterishness = 0;
glitter_gain = 0;
base_glitter_gain = global.DEFAULT_BASE_GLITTER_GAIN;
glitter_gain_factor = global.DEFAULT_GLITTER_GAIN_FACTOR;
glitter_gain = 0;
glitter_gain_max_mag = 0.4;
glitter_loss_max_mag = 0.8;

function set_weather_state(_weather) {
	/// @description Set the weather state, which controls the glitter gain rates for various actions
	switch _weather {
	case WeatherState.RAINBOW:
		glitter_gain_idle = 0.025;
		glitter_gain_walk = 0.05;
		glitter_gain_run = 0.2;
		glitter_gain_overload = -0.8;
		break;
	case WeatherState.SUNNY:
		glitter_gain_idle = -0.05;
		glitter_gain_walk = 0.0;
		glitter_gain_run = 0.05;
		glitter_gain_overload = -0.8;
		break;
	case WeatherState.CLOUDY: default:
		glitter_gain_idle = -0.2;
		glitter_gain_walk = -0.05;
		glitter_gain_run = 0.0;
		glitter_gain_overload = -0.8;
		break;
	case WeatherState.RAINY:
		glitter_gain_idle = -0.4;
		glitter_gain_walk = -0.1;
		glitter_gain_run = -0.05;
		glitter_gain_overload = -0.8;
		break;
	
	}
}

// Default to cloudy weather state
set_weather_state(WeatherState.SUNNY);