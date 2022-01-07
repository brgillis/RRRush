/// @description Set defaults for values stored through transitions

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
