/// Functions and constants related to drawing text

function draw_text_outline(x, y, text, offset=1, col=c_black)
{
	/// Draws an outline behind text by dithering and drawing the outline - must be called before drawing
	/// the text.
	
	draw_set_color(col);
	draw_text(x-offset,y-offset,text);
	draw_text(x+offset,y-offset,text);
	draw_text(x-offset,y+offset,text);
	draw_text(x+offset,y+offset,text);
}

global.TEXT_NO_OUTLINE = -1;

function draw_text_color_outline(x,
                                 y,
								 text,
								 l_c = [ c_white, c_white ],
								 alpha=1,
								 offset=1,
								 co=c_black)
{
	/// Draws text with a given color gradient and an outline behind it
	
	if (co!=global.TEXT_NO_OUTLINE)
		draw_text_outline(x, y, text, offset, co);
		
	// If l_c has two elements, treat it as a vertical gradient
	if (array_length(l_c)==2)
		l_c = [l_c[0], l_c[0], l_c[1], l_c[1]]
	draw_text_color(x, y, text, l_c[0], l_c[1], l_c[2], l_c[3], alpha);
}