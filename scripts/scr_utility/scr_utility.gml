/// Various utility functions

/// Convert a time value in frames to a displayable string
function get_time_string(time_frames)
{
	var _full_time_sec = time_frames / 60;
	var _full_time_min = _full_time_sec / 60;
	var _full_time_hr  = _full_time_min / 60;
	
	var _time_hr  = floor(_full_time_hr);
	var _time_min = floor(_full_time_min - 60*_time_hr);
	var _time_sec = _full_time_sec - 60*(_time_min + 60*_time_hr);
	
	if (_time_min == 0) and (_time_hr == 0)
	{
		var _time_sec_rounded = string_format(_time_sec,3,2);
		return _time_sec_rounded;
	}
	else
	{
		var _time_sec_rounded = string_format(_time_sec,4,2);
		if (_time_hr == 0)
		{
			var _time_min_rounded = string(_time_min);
			return concat(_time_min_rounded,":",_time_sec_rounded);
		}
		else
		{
			var _time_min_rounded = string_format(_time_min,2,0);
			return concat(_time_hr,":",_time_min_rounded,":",_time_sec_rounded);
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
function fapproach(_a, _b, _famount) 
{
	if (_a < _b)
	{
	    _a += _famount * (_b-_a);
	}
	else
	{
	    _a -= _famount * (_b-_a);
	}
	return _a;
}

//Sine waves a value between two values over a given time. 
function wave(_from, _to, _duration, _offset) 
{
	var a4 = (_to - _from) * 0.5;
	return _from + a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * a4; 
}

//Wraps a value between a minimum and a given wrap point
function wrap(_value, _minimum, _wrapAt) 
{

	var _mod = ( _value - _minimum ) mod ( _wrapAt - _minimum );
	if ( _mod < 0 ) return _mod + _wrapAt else return _mod + _minimum;
}