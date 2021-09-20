/// @description Draw GUI with timer

draw_self();

draw_set_valign(fa_middle);

draw_set_halign(fa_left);
draw_set_font(fnt_gui_time_label);
draw_text_color(x - 98,
                y + 2,
				label,
				label_c1,
				label_c2,
				label_c3,
				label_c4,
				1);
				

draw_set_halign(fa_right);
draw_set_font(fnt_gui_time_number);
draw_text_color(x + 95,
                y + 4,
				value,
				value_c1,
				value_c2,
				value_c3,
				value_c4,
				1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);