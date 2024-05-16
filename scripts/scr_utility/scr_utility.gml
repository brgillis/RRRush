/// Various utility functions

/// Convert a time value in frames to a displayable string
function get_time_string(_time_frames, _shorten=false)
{
	var _full_time_sec = _time_frames / 60;
	var _full_time_min = _full_time_sec / 60;
	var _full_time_hr  = _full_time_min / 60;
	
	var _time_hr  = floor(_full_time_hr);
	var _time_min = floor(_full_time_min - 60*_time_hr);
	var _time_sec = _full_time_sec - 60*(_time_min + 60*_time_hr);
	
	if (_time_hr > 99)
		return "99:59:59";
	
	if (_time_min == 0) and (_time_hr == 0)
	{
		var _time_sec_rounded = string_format(_time_sec, 2, 2);
		return _time_sec_rounded;
	}
	else
	{
		
		if (_shorten)
		{
			if (_time_min < 10)
			{
				var _sec_dec = 1;
				var _dec_digits = 2;
			}
			else
			{
				var _sec_dec = 0;
				var _dec_digits = 0;
			}
		}
		else
		{
			var _sec_dec = 2;
			var _dec_digits = 3;
		}
			
		var _time_sec_rounded = string_format(_time_sec, 1, _sec_dec);
		
			
		if (string_length(_time_sec_rounded) == 1+_dec_digits)
			var _time_sec_rounded = "0" + _time_sec_rounded;
			
		if (_time_hr == 0)
		{
			var _time_min_rounded = string_format(_time_min, 1, 0);
			return concat(_time_min_rounded,":",_time_sec_rounded);
		}
		else
		{
			if (string_length(_time_min_rounded) == 1)
				var _time_min_rounded = "0" + string_format(_time_min, 1, 0);
			else
				var _time_min_rounded = string_format(_time_min, 2, 0);
			var _time_hr_rounded = string_format(_time_hr,2,0);
			if (_shorten)
				return concat(_time_hr_rounded,":",_time_min_rounded);
			else
				return concat(_time_hr_rounded,":",_time_min_rounded,":",_time_sec_rounded);
		}
	}
		
}

/// Concatenate a series of arguments into a string
function concat() 
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
    return _string;
}

/// Show debug message enhanced with string concatenation
function debug_message()
{
    var _string = "";
    for(var i = 0; i < argument_count; i++) _string += string(argument[i]);
	show_debug_message(_string);
}



/// Move value towards another value by a given amount
function approach(_a, _b, _amount) 
{
	if (_a < _b)
	{
	    _a += _amount;
	    if (_a > _b)
	        return _b;
	}
	else
	{
	    _a -= _amount;
	    if (_a < _b)
	        return _b;
	}
	return _a;
}

/// Move value towards another value by a given fractional amount of the distance between them
function fapproach(_a, _b, _frac, _min) 
{
	var _amount = _frac * abs(_b-_a)
	if (_amount<_min)
		_amount = _min
	
	return approach(_a, _b, _amount);
}

// Sin waves a value between two values over a given time. 
function wave(_from, _to, _period, _offset=0) 
{
	return wave_position(_from, _to, (current_time * 0.001), _period, _offset);
}

function wave_position(_from, _to, _t, _period, _offset=0) 
{
	var a4 = (_to - _from) * 0.5;
	return _from + a4 + sin(((_t + _period * _offset) / _period) * (pi*2)) * a4; 
}

// Wraps a value between a minimum and a given wrap point
function wrap(_value, _minimum, _wrapAt) 
{

	var _mod = ( _value - _minimum ) mod ( _wrapAt - _minimum );
	if ( _mod < 0 ) return _mod + _wrapAt else return _mod + _minimum;
}

/// Project a scalar into an array of a given length, or if an array is provided, simply return it
function project_array(_a, _len)
{
	if (is_array(_a))
		if (array_length(_a)==_len)
			return _a
		else if (array_length(_a)==1)
			var _v = _a[0]
		else
			debug_message("Length of array ", _a, " is ", array_length(_a),
			              ", which doesn't match provided length ", _len)
	else
		var _v = _a
		
	return array_create(_len, _v)
}