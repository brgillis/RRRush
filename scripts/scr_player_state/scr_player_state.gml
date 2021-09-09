function update_player_sprite(dir=0){
	
	// Set the appropriate sprite
	sprite_index = global.aa_player_sprites[move_state][jump_state];
	image_index = global.a_player_images[jump_state];
	
	// Check the direction to decide if we want to flip the sprite
	if dir!=0
	{
		image_xscale = sign(dir)*abs(image_xscale)
	}
	
}

function set_move_state_idle(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (move_state==player_idle)
	{
		return;	
	}
	
	// Set the state and update the sprite
	move_state = player_idle;
	update_player_sprite()
}

function set_move_state_walk(dir=1){
	
	// Do nothing if the state and direction are already right, so as to not interrupt animations
	if ((move_state==player_walk) and (dir==current_dir))
	{
		return;	
	}
	
	// Set the state and update the sprite
	move_state = player_walk;
	update_player_sprite(dir)
}

function set_move_state_run(dir=1){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if ((move_state==player_run) and (dir==current_dir))
	{
		return;	
	}
	
	// Set the state and update the sprite
	move_state = player_run;
	update_player_sprite(dir)
}

function set_jump_state_ground(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==player_ground)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_ground;
	update_player_sprite()
}

function set_jump_state_jump(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==player_jump)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_jump;
	update_player_sprite();
	
	// Start the jump_time timer
	jump_time = global.total_jump_time;
	coyote_time = 0;
}

function set_jump_state_rise(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==player_rise)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_rise;
	jump_time = 0;
	update_player_sprite()
}

function set_jump_state_fall(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if jump_state==player_fall
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_fall;
	coyote_time = 0;
	update_player_sprite()
}

function set_jump_state_land(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if jump_state==player_land
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_land;
	update_player_sprite()
	
	// Start the land_time timer
	land_time = global.total_land_time
}

function set_jump_state_ground_coyote(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==player_ground_coyote)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_ground_coyote;
	coyote_time = global.total_coyote_time;
	update_player_sprite()
}

function set_jump_state_land_coyote(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==player_land_coyote)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = player_land_coyote;
	coyote_time = global.total_coyote_time;
	update_player_sprite()
}