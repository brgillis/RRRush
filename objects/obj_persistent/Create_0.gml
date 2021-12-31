/// @description Set defaults for values stored through transitions

// Store screen size info in variables
w = display_get_gui_width();
h = display_get_gui_height();
h_half = 0.5*h;

// Define an enum for ways to transition between rooms
enum TransMode
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

// Initialize transition mode and variables related to transitions
mode = TransMode.INTRO;
percent = 1;
target = room;
