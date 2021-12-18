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

function draw_text_color_outline(x,
                                 y,
								 text,
								 c1=c_white,
								 c2=c_white,
								 c3=c_white,
								 c4=c_white,
								 alpha=1,
								 offset=1,
								 co=c_black)
{
	/// Draws text with a given color gradient and an outline behind it
	
	draw_text_outline(x, y, text, offset, co);
	draw_text_color(x, y, text, c1, c2, c3, c4, alpha);
}