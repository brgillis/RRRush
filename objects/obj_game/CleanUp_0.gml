/// @description Clean up particle system and stop music

audio_stop_sound(game_music);

part_type_destroy(glitter_collect);
part_type_destroy(glitter_gui);

part_system_destroy(particle_system_between);
part_system_destroy(particle_system_gui);