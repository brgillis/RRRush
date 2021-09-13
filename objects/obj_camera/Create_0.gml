/// @description Create the camera

// Initialize position at position of player

function update_position(){

	// Move toward x_yo, y_to

	x += (x_to-x)*global.camera_x_speed;
	y += (y_to-y)*global.camera_y_speed;

	if (follow != noone)
	{
		x_to = follow.x;
		y_to = follow.y;
	}
	
	// Bound the camera's viewport within the room
	if (x < global.viewport_width/2)
	{
		x = global.viewport_width/2;
	}
	else if (x > room_width - global.viewport_width/2)
	{
		x = room_width - global.viewport_width/2;
	}
	if (y < global.viewport_height/2)
	{
		y = global.viewport_height/2;
	}
	else if (y > room_height - global.viewport_height/2)
	{
		y = room_height - global.viewport_height/2;
	}

	var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
	var pm = matrix_build_projection_ortho(global.viewport_width,global.viewport_height,1,10000);

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
