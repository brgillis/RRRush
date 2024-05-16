/// @description Draw glitter particles
	  
// Draw particles on the GUI layer if not paused
if (global.game_state!=GameState.MENU)
	part_system_drawit(obj_game.particle_system_gui);