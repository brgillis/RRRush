/// Initialize various things for the game

// Enum values for game state
enum GameState {
	MENU = 0,
	ACTIVE = 1,
	NO_CONTROL = 2,
	OVERLOAD = 3,
	STAGE_END = 4,
}

// Enum values for the player movement state
enum MoveState {
	IDLE = 0,
	WALK = 1,
	RUN = 2,
}

// Enum values for the player jumping state
enum JumpState {
	GROUND = 0,
	JUMP = 1,
	RISE = 2,
	FALL = 3,
	LAND = 4,
	GROUND_COYOTE = 5,
	LAND_COYOTE = 6,
}

// Create an array of sprites for each possible state
global.AA_PLAYER_SPRITES = array_create(3, [], [], [])
global.AA_PLAYER_SPRITES[MoveState.IDLE] = [spr_player_idle, spr_player_jump_idle, spr_player_jump_idle,
                                         spr_player_jump_idle, spr_player_idle,
										 spr_player_idle, spr_player_idle ];
global.AA_PLAYER_SPRITES[MoveState.WALK] = [spr_player_walk, spr_player_jump_walk, spr_player_jump_walk,
                                         spr_player_jump_walk, spr_player_walk,
										 spr_player_walk, spr_player_walk];
global.AA_PLAYER_SPRITES[MoveState.RUN]  = [spr_player_run, spr_player_jump_run, spr_player_jump_run,
                                         spr_player_jump_run,  spr_player_run,
										 spr_player_run, spr_player_run];
global.A_PLAYER_IMAGES = [0, 0, 0,
                          1, 0,
						  0, 0]
						  
// Constants related to display

global.DISPLAY_WIDTH = display_get_gui_width();
global.DISPLAY_HEIGHT = display_get_gui_height();

global.GUI_MARGIN = 32;
global.GUI_WIDTH = global.DISPLAY_WIDTH - global.GUI_MARGIN;
global.GUI_HEIGHT = global.DISPLAY_HEIGHT - global.GUI_MARGIN;

// Constants related to motion

// Walking
global.WALK_ACCEL = 0.5
global.WALK_SPEED = 5

// Running
global.RUN_ACCEL = 0.5
global.RUN_DECEL = 2
global.RUN_SPEED = 10

// Slopes
global.SLOPE_UP_FACTOR = 0.9
global.SLOPE_DOWN_FACTOR = 1.25

// Jumping
global.TOTAL_JUMP_TIME = 20
global.JUMP_INIT_VSPEED = -12
global.JUMP_VACCEL = -0.75

// Idle air
global.IDLE_AIR_ACCEL = 0.5*global.WALK_ACCEL
global.MIN_IDLE_AIR_SPEED = -global.WALK_SPEED
global.MAX_IDLE_AIR_SPEED = global.WALK_SPEED

// Walk air
global.WALK_AIR_ACCEL = 1*global.WALK_ACCEL
global.MIN_WALK_AIR_SPEED = -global.WALK_SPEED
global.MAX_WALK_AIR_SPEED = global.WALK_SPEED

// Run air
global.RUN_AIR_ACCEL = 1*global.RUN_ACCEL
global.MIN_RUN_AIR_SPEED = -global.RUN_SPEED
global.MAX_RUN_AIR_SPEED = global.RUN_SPEED

// Landing
global.TOTAL_LAND_TIME = 5
global.SUPER_JUMP_FACTOR = 1.25

// Coyote time
global.TOTAL_COYOTE_TIME = 5

// Gravity
global.GRAVITY_RISE_VACCEL = 0.9
global.GRAVITY_FALL_VACCEL = 1.4

// Glitterishness
global.GLITTER_MIN = 0
global.GLITTER_MAX = 100
global.GLITTER_DECAY_IDLE = 0.2
global.GLITTER_DECAY_WALK = 0.05
global.GLITTER_DECAY_RUN = 0.0
global.GLITTER_OVERLOAD_FACTOR = 4
global.GLITTER_GAIN_FACTOR = 1.0

// Camera controls
global.CAMERA_X_SPEED = 0.2;
global.CAMERA_Y_SPEED = 0.2;
global.CAMERA_DRAG_LEFT = 70;
global.CAMERA_DRAG_RIGHT = 70;
global.CAMERA_DRAG_BOTTOM = 70;
global.CAMERA_DRAG_TOP = 70;
global.VIEWPORT_WIDTH = 1366;
global.VIEWPORT_HEIGHT = 768;

// Effects
global.GLITTER_PARTICLE_RATE = 50;
global.GLITTER_PARTICLE_POWER = 6;

// Misc variables
global.game_state = GameState.MENU;
global.player_control = false;
global.player_move = false;
 
// Init the RNG
randomize();