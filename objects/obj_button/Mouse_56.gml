/// @description Change to pressed unselected briefly

// Check that it's in pre-pressed state
if (image_index==3)
{
	image_index = 2;
	alarm_set(0,3);
}
