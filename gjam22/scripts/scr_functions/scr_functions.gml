function createAt(object){
	return(instance_create_layer(x,y,layer,object));
}

function minion_mount_pos(minion_id)
{
	//check if owner exists
	if(!instance_exists(minion_id.owner))
	{
		return -1;
	}
	
	//find minion index
	var minion_num = array_find_index(minion_id.owner.minion_arr, minion_id);
	if(minion_num = -1)
	{
		return -1;
	}
	
	var angle = minion_num * 360 / array_length(minion_id.owner.minion_arr) + minion_id.owner.inp_aim;
	
	var pos = [];
	var sqBound = owner.minion_radius
	pos[0] = minion_id.owner.x + clamp(lengthdir_x(minion_id.owner.minion_radius*2, angle),-sqBound,sqBound);
	pos[1] = minion_id.owner.y + clamp(lengthdir_y(minion_id.owner.minion_radius*2, angle),-sqBound,sqBound);
	
	return pos;
}
