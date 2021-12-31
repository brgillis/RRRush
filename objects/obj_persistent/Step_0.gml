/// @description Progress transition between rooms

if (mode != TransMode.OFF)
{
	// Adjust fade percent as appropriate
	if (mode == TransMode.INTRO)
	{
		// Intro mode - we've arrived where we want to, so fade in percent from 1 to 0
		percent = max(0, percent - max((percent/10), 0.005));
	}
	else
	{
		// Fade out percent from 0 to 1
		percent = min(1, percent + max(((1 - percent)/10),0.005));
	}
	
	// Check if we need to switch mode
	if ((percent==1) || (percent==0))
	{
		switch (mode)
		{
		case TransMode.INTRO:
			// After INTRO, we've ended the transition, so set it to OFF
			mode = TransMode.OFF;
			break;
		case TransMode.GOTO:
			mode = TransMode.INTRO;
			room_goto(target);
			break;
		case TransMode.NEXT:
			mode = TransMode.INTRO;
			room_goto_next();
			break;
		case TransMode.RESTART:
			mode = TransMode.INTRO;
			room_restart();
			break;
		}
	}
}