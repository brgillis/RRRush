/// @description Create the camera

// Initialize position at position of player

function update_position(){

	// Move toward x_yo, y_to

	x += (x_to-x)*global.CAMERA_X_SPEED;
	y += (y_to-y)*global.CAMERA_Y_SPEED;

	if (follow != noone)
	{
		if (x < follow.x - global.CAMERA_DRAG_LEFT)
			x_to = follow.x - global.CAMERA_DRAG_LEFT;
		else if (x > follow.x + global.CAMERA_DRAG_RIGHT)
			x_to = follow.x + global.CAMERA_DRAG_LEFT;
		if (y < follow.y - global.CAMERA_DRAG_TOP)
			y_to = follow.y - global.CAMERA_DRAG_TOP;
		else if (y > follow.y + global.CAMERA_DRAG_BOTTOM)
			y_to = follow.y + global.CAMERA_DRAG_BOTTOM;
	}
	
	// Bound the camera's viewport within the room
	if (x < global.VIEWPORT_WIDTH/2)
	{
		x = global.VIEWPORT_WIDTH/2;
	}
	else if (x > room_width - global.VIEWPORT_WIDTH/2)
	{
		x = room_width - global.VIEWPORT_WIDTH/2;
	}
	if (y < global.VIEWPORT_HEIGHT/2)
	{
		y = global.VIEWPORT_HEIGHT/2;
	}
	else if (y > room_height - global.VIEWPORT_HEIGHT/2)
	{
		y = room_height - global.VIEWPORT_HEIGHT/2;
	}

	var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
	var pm = matrix_build_projection_ortho(global.VIEWPORT_WIDTH,global.VIEWPORT_HEIGHT,1,10000);

	camera_set_view_mat(camera,vm);
	camera_set_proj_mat(camera,pm);

}

// Initialize variables
follow = obj_player;
camera = camera_create();
view_camera[0] = camera;


// Set the camera object at its initial position, following the player

x = follow.x;
y = follow.y;
	
x_to = x;
y_to = y;

update_position();

// Get the ID for the parallax background layer
parallax_layer = layer_get_id("Parallax_Background")
