/// @description Functionality to support glitter effects

function chance_burst(_n_part) {
	
	var _floor_n_part = floor(_n_part);
	
	if (_floor_n_part==_n_part)
		return _n_part;
		
	var _chance = _n_part - _floor_n_part;
	
	if (random(1)<_chance)
		return _floor_n_part+1;
		
	return _floor_n_part;
	
}

function burst_radial(_particle_system, _x, _y, _particle_type, _n_part=30, _r=10) {
	/// @ description Burt particles from random points in a radial spread
	
	_n_part = chance_burst(_n_part);
								  
	for(var _i=0; _i<_n_part; _i++)
	{
		var _dr = random_range(0, _r);
		var _theta = random_range(0, 360);
		var _x_source = _x + _dr * dcos(_theta);
		var _y_source = _y + _dr * dsin(_theta);

		// Burst glitter particles
		part_particles_create(_particle_system, _x_source, _y_source, _particle_type, 1);
	}
}

function burst_rect(_particle_system, _x_min, _x_max, _y_min, _y_max, _particle_type, _n_part=30) {
	/// @ description Burt particles from random points in a rectangular spread
	
	_n_part = chance_burst(_n_part);
								  
	for(var _i=0; _i<_n_part; _i++)
	{
		var _x_source = random_range(_x_min, _x_max);
		var _y_source = random_range(_y_min, _y_max);

		// Burst glitter particles
		part_particles_create(_particle_system, _x_source, _y_source, _particle_type, 1);
	}
}

enum FlashMag {
	NONE = 0,
	MIN = 1,
	WEAK = 2,
	MILD = 3,
	MED = 4,
	STRONG = 5,
	INTENSE = 6,
	MAX = 7,
}

function get_flash_mag(_flash_time, _intense=false) {
	/// @description Given the number of frames of flashing remaining, return the magnitude of the flash
	/// for this frame as a FlashMag Enum. If `_intense==true`, will increase magnitude of each step by 1
	switch _flash_time
	{
	case 1:
		var _mag = FlashMag.MIN;
		break;
	case 2: case 8:
		var _mag = FlashMag.WEAK;
		break;
	case 3:
		var _mag = FlashMag.MILD;
		break;
	case 4: case 7:
		var _mag = FlashMag.MED;
		break;
	case 5: case 6:
		var _mag = FlashMag.INTENSE;
		break;
	case 0: default:
		var _mag = FlashMag.NONE;
		break;
	}
	
	if (not _intense)
		// If not intense, cut magnitude in half (integer division will ensure this is kept to valid values)
		_mag /= 2;
		
	return _mag
}

function set_flash_shader(_flash_time, _intense=false, _r_frac=1.0, _g_frac=1.0, _b_frac=1.0) {
	
	var _flash_mag = get_flash_mag(_flash_time, _intense);
		
	switch _flash_mag
	{
	case FlashMag.MIN:
	case FlashMag.WEAK:
	case FlashMag.MILD:
	case FlashMag.MED:
	case FlashMag.STRONG:
	case FlashMag.INTENSE:
	case FlashMag.MAX:
		shader_set(sh_flash);
		var _flash_frac = get_flash_frac(_flash_mag);
		var _u_frac = shader_get_uniform(sh_flash, "u_frac");
		shader_set_uniform_f(_u_frac, _flash_frac*_r_frac,
		                              _flash_frac*_g_frac,
		                              _flash_frac*_b_frac);
		break;
	case FlashMag.NONE: default:
		shader_reset();
		break;
	}
}

function get_flash_frac(_flash_mag) {
		
	switch _flash_mag
	{
	case FlashMag.MIN:
	case FlashMag.WEAK:
	case FlashMag.MILD:
	case FlashMag.MED:
	case FlashMag.STRONG:
	case FlashMag.INTENSE:
		return 0.15*_flash_mag;
		break;
	case FlashMag.MAX:
		return 1.0;
		break;
	case FlashMag.NONE: default:
		return 0.0;
		break;
	}
}