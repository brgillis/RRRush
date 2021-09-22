// Initialize various things for the game

// Enum values for the player movement state // TODO - change to Enum
#macro player_idle 0
#macro player_walk 1
#macro player_run 2

// Enum values for the player jumping state
#macro player_ground 0
#macro player_jump 1
#macro player_rise 2
#macro player_fall 3
#macro player_land 4
#macro player_ground_coyote 5
#macro player_land_coyote 6

// Create an array of sprites for each possible state
global.aa_player_sprites = array_create(3, [], [], [])
global.aa_player_sprites[player_idle] = [spr_player_idle, spr_player_jump_idle, spr_player_jump_idle,
                                         spr_player_jump_idle, spr_player_idle,
										 spr_player_idle, spr_player_idle ];
global.aa_player_sprites[player_walk] = [spr_player_walk, spr_player_jump_walk, spr_player_jump_walk,
                                         spr_player_jump_walk, spr_player_walk,
										 spr_player_walk, spr_player_walk];
global.aa_player_sprites[player_run]  = [spr_player_run, spr_player_jump_run, spr_player_jump_run,
                                         spr_player_jump_run,  spr_player_run,
										 spr_player_run, spr_player_run];
global.a_player_images = [0, 0, 0,
                          1, 0,
						  0, 0]

// Constants related to motion

// Walking
global.walk_accel = 0.5
global.walk_speed = 5

// Running
global.run_accel = 0.5
global.run_decel = 2
global.run_speed = 10

// Slopes
global.slope_up_factor = 0.9
global.slope_down_factor = 1.25

// Jumping
global.total_jump_time = 20
global.jump_init_vspeed = -12
global.jump_vaccel = -0.75

// Idle air
global.idle_air_accel = 0.5*global.walk_accel
global.min_idle_air_speed = -global.walk_speed
global.max_idle_air_speed = global.walk_speed

// Walk air
global.walk_air_accel = 1*global.walk_accel
global.min_walk_air_speed = -global.walk_speed
global.max_walk_air_speed = global.walk_speed

// Run air
global.run_air_accel = 1*global.run_accel
global.min_run_air_speed = -global.run_speed
global.max_run_air_speed = global.run_speed

// Landing
global.total_land_time = 5
global.super_jump_factor = 1.25

// Coyote time
global.total_coyote_time = 5

// Gravity
global.gravity_rise_vaccel = 0.9
global.gravity_fall_vaccel = 1.4

// Camera controls
global.camera_x_speed = 0.2;
global.camera_y_speed = 0.2;
global.camera_drag_left = 70;
global.camera_drag_right = 70;
global.camera_drag_bottom = 70;
global.camera_drag_top = 70;
global.viewport_width = 1366;
global.viewport_height = 768;

// Effects
global.glitter_rate = 50;
global.glitter_power = 6;
 
// Init the RNG
randomize();

// Misc variables
global._tmp_best_time_frames = 200;