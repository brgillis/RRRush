/// @description Handle player effects

switch flash_time
{
case 1:
case 2:
case 8:
	shader_set(sh_flash_mild);
	break;
case 3:
case 4:
case 7:
	shader_set(sh_flash_med);
	break;
case 5:
case 6:
	shader_set(sh_flash_strong);
	break;
default:
	break;
}

draw_self();
shader_reset();