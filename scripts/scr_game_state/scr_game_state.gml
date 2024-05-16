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

function set_game_state_stage_end() {
	
	// Update the game state
	global.game_state = GameState.STAGE_END;
	
	// Set player control and move flags appropriately
	global.player_control = false;
	global.player_move = true;
}

function set_game_state(game_state) {
	switch (game_state)
	{
	case GameState.ACTIVE: default:
		set_game_state_active();
		break;
	case GameState.MENU:
		set_game_state_menu();
		break;
	case GameState.NO_CONTROL:
		set_game_state_no_control();
		break;
	case GameState.OVERLOAD:
		set_game_state_overload();
		break;
	case GameState.STAGE_END:
		set_game_state_stage_end();
		break;
	}
}