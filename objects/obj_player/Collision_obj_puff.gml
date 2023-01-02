/// @description Collect puff

// Increment counter and increase glitterishness
obj_game.glitterpuffs_collected += 10;
obj_game.glitterishness += 10;

// Burst glitter particles

burst_anim(other);

// Destroy the puff instance
instance_destroy(other);