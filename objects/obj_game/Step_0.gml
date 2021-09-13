/// @description Update globals

global.time_frames += 1;

// Modify glitterishness (test)
if keyboard_check(ord("U"))
	global.glitterishness += 1;
if keyboard_check(ord("J"))
	global.glitterishness -= 1;
