/// @description Resume animation for all objects and sequences

for (var i = 0; i < instance_number(all); ++i;)
{
	instance = instance_find(all, i);
	instance.image_speed =  l_instance_image_speed[i];
}

for (var i = 0; i <num_seq; ++i;)
{
	var seq = l_seq_ids[i];
	layer_sequence_play(seq);
}