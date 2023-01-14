/// @description Functionality to support bursts of glitter particles

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