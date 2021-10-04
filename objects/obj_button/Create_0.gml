/// @description Define text and otherwise init

// Set text and text color
text = "Text";
text_c1 = $0000B0;
text_c2 = $0000B0;
text_c3 = $000080;
text_c4 = $000080;

// Ensure sprite is set to the first frame
image_index = 0;

// Define a function to check if the mouse is hovering over this button
function get_mouse_hover()
{
	mx = window_mouse_get_x();
	my = window_mouse_get_y();
	
	return point_in_rectangle(mx, my, bbox_left, bbox_top, bbox_right, bbox_bottom);
}