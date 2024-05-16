function update_player_sprite(dir=0){
	
	// Set the appropriate sprite
	sprite_index = global.AA_PLAYER_SPRITES[move_state][jump_state];
	image_index = global.A_PLAYER_IMAGES[jump_state];
	
	// Check the direction to decide if we want to flip the sprite
	if dir!=0
	{
		image_xscale = sign(dir)*abs(image_xscale)
	}
	
}

function set_move_state_idle(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (move_state==MoveState.IDLE)
	{
		return;	
	}
	
	// Set the state and update the sprite
	move_state = MoveState.IDLE;
	update_player_sprite()
}

function set_move_state_walk(dir=1){
	
	// Do nothing if the state and direction are already right, so as to not interrupt animations
	if ((move_state==MoveState.WALK) and (dir==current_dir))
	{
		return;	
	}
	
	// Set the state and update the sprite
	move_state = MoveState.WALK;
	update_player_sprite(dir)
}

function set_move_state_run(dir=1){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if ((move_state==MoveState.RUN) and (dir==current_dir))
	{
		return;	
	}
	
	// Set the state and update the sprite
	move_state = MoveState.RUN;
	update_player_sprite(dir)
}

function set_jump_state_ground(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==JumpState.GROUND)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.GROUND;
	update_player_sprite()
}

function set_jump_state_jump(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==JumpState.JUMP)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.JUMP;
	update_player_sprite();
	
	// Start the jump_time timer
	jump_time = global.TOTAL_JUMP_TIME;
	coyote_time = 0;
}

function set_jump_state_rise(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==JumpState.RISE)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.RISE;
	jump_time = 0;
	update_player_sprite()
}

function set_jump_state_fall(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if jump_state==JumpState.FALL
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.FALL;
	coyote_time = 0;
	update_player_sprite()
}

function set_jump_state_land(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if jump_state==JumpState.LAND
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.LAND;
	update_player_sprite()
	
	// Start the land_time timer
	land_time = global.TOTAL_LAND_TIME
}

function set_jump_state_ground_coyote(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==JumpState.GROUND_COYOTE)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.GROUND_COYOTE;
	coyote_time = global.TOTAL_COYOTE_TIME;
	update_player_sprite()
}

function set_jump_state_land_coyote(){
	
	// Do nothing if the state is already right, so as to not interrupt animations
	if (jump_state==JumpState.LAND_COYOTE)
	{
		return;	
	}
	
	// Set the state and update the sprite
	jump_state = JumpState.LAND_COYOTE;
	coyote_time = global.TOTAL_COYOTE_TIME;
	update_player_sprite()
}