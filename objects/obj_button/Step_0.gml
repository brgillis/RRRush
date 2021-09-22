/// @description Set sprite based on mouse hovering/not hovering

if (image_index==0) or (image_index==1)
{
	if (get_mouse_hover())
		image_index = 1;
	else
		image_index = 0;
}