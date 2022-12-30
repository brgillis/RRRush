function room_transition(_mode, _target_room=-1){
	/// @desc Transition to a desired room
	/// @arg mode sets transition mode TransMode between NEXT, GOTO, and RESTART
	/// @arg target_room sets target room (if using GOTO mode)

	// Use the persistent object to set up the transition
	obj_persistent.room_transition(_mode, _target_room);
}