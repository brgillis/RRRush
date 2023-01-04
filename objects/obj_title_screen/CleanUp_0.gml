/// @description Stop the music and clean up

audio_stop_sound(title_music);

part_system_destroy(particle_system_between);
part_system_destroy(particle_system_gui);