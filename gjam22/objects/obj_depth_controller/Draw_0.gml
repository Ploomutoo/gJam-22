//getting array of all sorted instances
inst_arr = [];
with(obj_depth_sort)
{
	array_push(other.inst_arr, id);
}

//sorting array according to position
array_sort(inst_arr, function(_elm1, _elm2)
{
	if(_elm1.y = _elm2.y)
	{
		return _elm1.z - _elm2.z;
	}
    return _elm1.y - _elm2.y;
}); 

//drawing shadows
for(var i = 0; i < array_length(inst_arr); i++)
{
	with(inst_arr[i]) if(!hide) 
	{
		var shadow_xscale = (bbox_right-bbox_left)/sprite_get_width(spr_shadow);
		var shadow_yscale = (bbox_bottom-bbox_top)/sprite_get_height(spr_shadow);
		draw_sprite_ext(spr_shadow, 0, round(x), round(y), shadow_xscale, shadow_yscale, 0, c_black, 0.5);
	}
}

//drawing objects
for(var i = 0; i < array_length(inst_arr); i++)
{
	with(inst_arr[i])
	{
		var old_x = x;
		var old_y = y;
		
		x = round(x);
		y = round(y-z);
		event_perform(ev_draw, 0);
		x = old_x;
		y = old_y;
	}
}

