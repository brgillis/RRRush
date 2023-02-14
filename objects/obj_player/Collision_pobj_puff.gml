/// @description Collect puff

// Increment counter and increase glitterishness
obj_game.glitterpuffs_collected += 1;
obj_game.gain_glitter(other.glitterishness);

// Burst glitter particles

if other.glitterishness >= 5
	var _sound_gain = 1.0
else
	var _sound_gain = 0.5

burst_anim(other, 6*other.glitterishness, _sound_gain);

// Destroy the puff instance
instance_destroy(other);