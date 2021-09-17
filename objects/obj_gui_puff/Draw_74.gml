/// @description Draw in GUI layer

draw_self();

draw_set_font(fnt_gui_puffs);

draw_set_halign(fa_right);
draw_set_valign(fa_middle);

draw_text_color(x + 90,
                y + 2,
				string(obj_game.glitterpuffs_collected),
				$A0A0FF,
				$7070FF,
				$4040FF,
				$7070FF,
				1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);