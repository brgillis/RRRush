/// @description Start fadeout before restart

// Inherit the parent event
event_inherited();

// Fade out to a black screen

i_seq_fade_out = layer_sequence_create("Screen_cover",0,0,seq_fade_out);
alarm_set(1,20)