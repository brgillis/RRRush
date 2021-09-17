/// @description Draw GUI with timer

draw_self();

draw_set_valign(fa_middle);

draw_set_halign(fa_left);
draw_set_font(fnt_gui_time_label);
draw_text_color(x - 98,
                y + 2,
				"Time: ",
				$A0A0FF,
				$7070FF,
				$4040FF,
				$7070FF,
				1);
				

draw_set_halign(fa_right);
draw_set_font(fnt_gui_time_number);
draw_text_color(x + 95,
                y + 4,
				string_format(obj_game.time_frames / 60,3,2),
				$A0A0FF,
				$7070FF,
				$4040FF,
				$7070FF,
				1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);