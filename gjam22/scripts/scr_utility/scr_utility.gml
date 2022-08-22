function soundRand(argument0) {
	audio_stop_sound(argument0)
	audio_sound_pitch(argument0,1+random_range(-0.2,0.2))
	audio_play_sound(argument0,0,0)
}

function approach(_start, _end, _shift)
{
	if (_start < _end)
	{
	    return min(_start + _shift, _end); 
	}
	else
	{
	    return max(_start - _shift, _end);
	}
}

function array_find_index(id, val)
{
	for(var i = 0; i < array_length(id); i++)
	{
		if(id[i] = val)
		{
			return i;
		}
	}
	return -1;
}
