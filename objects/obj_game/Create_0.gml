/// @description Init for each level

#macro FADE_IN_TIME_MS 1000

// Start without contol - control will be enabled after fade-in
set_game_state_no_control();

// Start playing music, fading it in
game_music = audio_play_sound(msc_world_1, 0, true, 0);
audio_sound_gain(game_music, 1, FADE_IN_TIME_MS);

// Init variables

time_frames = 0;
puffs_collected = 0;
glitterpuffs_collected = 0;
glitterishness = 0;
level_complete = false;

fade_in = true; // Note at start we're fading in, so we can set game state to active only once

particle_system_between = part_system_create_layer("Effects_between", 0);
particle_system_gui = part_system_create_layer("Effects_gui", 0);