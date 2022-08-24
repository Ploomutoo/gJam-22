function soundRand(play) {
	
	audio_stop_sound(play)
	audio_sound_pitch(play,1+random_range(-0.2,0.2))
	audio_play_sound(play,0,0)
}

function barkRand() {
	
	if(argument_count<1) exit;
	if(argument_count=1) var play = argument[0];
	else var play = argument[irandom(argument_count-1)];
	
	for(var i = argument_count-1; i>=0; i--) {
		audio_stop_sound(argument[i])
	}
	//audio_sound_pitch(play,1+random_range(-0.2,0.2))
	audio_play_sound(play,0,0)
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
