/// @description Data and functions related to world/stage layout

// Enums for menu options

enum WorldSelectOption {
	WORLD_1 = 9,
	WORLD_2 = 8,
	WORLD_3 = 7,
	WORLD_4 = 6,
	WORLD_5 = 5,
	WORLD_6 = 4,
	WORLD_7 = 3,
	WORLD_8 = 2,
	DEBUG = 1,
	BACK = 0,
}

enum StageSelectOption {
	STAGE_4 = 3,
	STAGE_3 = 2,
	STAGE_2 = 1,
	STAGE_1 = 0,
}

global.NUM_WORLDS = 8;
global.NUM_STAGES = 4;

global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_1] = [rm_w1_s1, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_2] = [0, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_3] = [0, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_4] = [0, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_5] = [0, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_6] = [0, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_7] = [0, 0, 0, 0]
global.LL_ROOM_TARGETS[WorldSelectOption.WORLD_8] = [0, 0, 0, 0]

function get_world_number(_world_index) {
	return WorldSelectOption.WORLD_1-_world_index+1;
}
function get_world_index(_world_number) {
	return WorldSelectOption.WORLD_1-_world_number+1
}
function get_stage_number(_stage_index) {
	return _stage_index+1;
}
function get_stage_index(_stage_number) {
	return _stage_number-1;
}
function get_next_stage(_world_index, _stage_index) {
	var _new_stage_index = _stage_index + 1;
	var _new_world_index = _world_index;
	if (_new_stage_index >= global.NUM_STAGES)
	{
		_new_stage_index = 0;
		_new_world_index += 1;
		if (_new_world_index >= global.NUM_WORLDS)
		{
			_new_world_index = 0;
		}
	}
	return [_new_world_index, _new_stage_index];
}