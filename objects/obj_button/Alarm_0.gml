/// @description Revert to normal sprite

if (get_mouse_hover())
	image_index = 0;
else
	image_index = 1;
audio_play_sound(snd_button_up,1,false);