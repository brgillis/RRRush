/// @description Execute menu choice

// Inherit the parent event
event_inherited();

// Return to the title menu on any selection
instance_create_layer(0,0,"Instances",obj_title_menu);
obj_title_screen.recreate_title();

instance_destroy();
