/// @description Draw current level of glitterishness

draw_self();

draw_healthbar(x+12, // x1
               y+15, // y1
			   x+207, // x2
			   y+57, // y2
			   global.glitterishness, // amount
			   $00000000, // background color
			   $FFFF0000, // min color
			   $FF8080FF, // max color
			   0, // direction
			   false, // show background
			   true); // show border