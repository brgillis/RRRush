/// @description Start the music and enable particles

title_music = audio_play_sound(msc_title, 0, true);

particle_system_between = part_system_create_layer("Effects_between", 0);
particle_system_gui = part_system_create_layer("Effects_gui", 0);