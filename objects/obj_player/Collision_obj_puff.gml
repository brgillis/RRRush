/// @description Collect puff

// Increment counter and increase glitterishness
obj_game.glitterpuffs_collected += 10;
obj_game.glitterishness += 10;

// Burst glitter particles
part_particles_create(obj_game.particle_system_between, other.x, other.y, obj_game.glitter_collect, 30);

// Flash the player white
flash_time = 8;

// Play sound
audio_play_sound(snd_puff_collect, 2, false);

// Destroy the puff instance
instance_destroy(other);