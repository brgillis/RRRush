function tile_meeting(argument0, argument1, argument2){
	///@description tile_meeting(x,y,layer)
	///@param x
	///@param y
	///@param layer
	var _layer = argument2,
	    _tm = layer_tilemap_get_id(_layer);

	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (argument0 - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (argument1 - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (argument0 - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (argument1 - y));

	for(var _x = _x1; _x <= _x2; _x++){
	 for(var _y = _y1; _y <= _y2; _y++){
	    if(tile_get_index(tilemap_get(_tm, _x, _y))){
	    return true;
	    }
	 }
	}

	return false;
}

function tile_meeting_precise(argument0, argument1, argument2){
	///@description tile_meeting_precise(x,y,layer)
	///@param x
	///@param y
	///@param layer
	var _layer = argument2,
	    _tm = layer_tilemap_get_id(_layer),
	    _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker);
	
	var _x_left =  bbox_left + (argument0 - x);
	var _y_top =  bbox_top + (argument1 - y);
	var _x_right =  bbox_right + (argument0 - x);
	var _y_bottom =  bbox_bottom + (argument1 - y);
	
	// Check for left/right/bottom boundary collision
	if (_x_left < 0) or (_x_right > room_width) or (_y_bottom > room_height)
		return true;


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, _x_left, y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, _y_top),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, _x_right, y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, _y_bottom);

	for(var _x = _x1; _x <= _x2; _x++){
	 for(var _y = _y1; _y <= _y2; _y++){
	    var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
	    if(_tile){
	     if(_tile == 1) return true;

	     _checker.x = _x * tilemap_get_tile_width(_tm);
	     _checker.y = _y * tilemap_get_tile_height(_tm);
	     _checker.image_index = _tile;

	     if(place_meeting(argument0,argument1,_checker)) return true;
	    }
	 }
	}

	return false;
}

function obj_or_tile_meeting(argument0, argument1){
	
	obj_meet = place_meeting(argument0, argument1, obj_parent_all_collide);
	tile_meet = tile_meeting_precise(argument0, argument1, "Collision");
	//tile_meet = tile_meeting(argument0, argument1, "Collision");
	
	return obj_meet or tile_meet;
}