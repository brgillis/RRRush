/// @description Update globals

time_frames += 1;

// Modify glitterishness (test)
if (keyboard_check(ord("U")))
	glitterishness += 1;
if (keyboard_check(ord("J")))
	glitterishness -= 1;

if (glitterishness > 100)
	glitterishness = 100;
else if (glitterishness < 0)
	glitterishness = 0;