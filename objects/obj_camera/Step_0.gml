/// @description Follow the player

// Update the camera position

update_position();

if (layer_exists(parallax_layer))
{
	layer_x(parallax_layer,0.8*x)
}