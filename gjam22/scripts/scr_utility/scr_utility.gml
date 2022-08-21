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
