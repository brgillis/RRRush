function set_game_state_menu() {
	
	// Update the game state
	global.game_state = GameState.MENU;
	
	// Set player control and move flags appropriately
	global.player_control = false;
	global.player_move = false;
}

function set_game_state_active() {
	
	// Update the game state
	global.game_state = GameState.ACTIVE;
	
	// Set player control and move flags appropriately
	global.player_control = true;
	global.player_move = true;
}

function set_game_state_no_control() {
	
	// Update the game state
	global.game_state = GameState.NO_CONTROL;
	
	// Set player control and move flags appropriately
	global.player_control = false;
	global.player_move = true;
}

function set_game_state_overload() {
	
	// Update the game state
	global.game_state = GameState.OVERLOAD;
	
	// Set player control and move flags appropriately
	global.player_control = false;
	global.player_move = true;
}

function set_game_state_pause() {
	
	// Update the game state
	global.game_state = GameState.PAUSE;
	
	// Set player control and move flags appropriately
	global.player_control = false;
	global.player_move = false;
}

function set_game_state_stage_end() {
	
	// Update the game state
	global.game_state = GameState.STAGE_END;
	
	// Set player control and move flags appropriately
	global.player_control = false;
	global.player_move = false;
}