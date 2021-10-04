/// @description Destroy the fade in sequence and allow the player to move
layer_sequence_destroy(i_seq_fade_in);
global.player_control = true;
global.player_move = true;
