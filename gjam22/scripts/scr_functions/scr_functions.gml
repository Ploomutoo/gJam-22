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
	//show_debug_message("gonna function\n"+string(minion_id.owner.minion_arr)+", "+string(minion_id))
	
	var minion_num = arrFindIndex(minion_id.owner.minion_arr, minion_id);
	if(minion_num = -1)
	{
		return -1;
	}
	
	var angle = minion_num * 360 / array_length(minion_id.owner.minion_arr) + minion_id.owner.inp_aim;
	
	var pos = [];
	//var sqBound = owner.minion_radius
	pos[0] = minion_id.owner.x + lengthdir_x(minion_id.owner.minion_radius,angle);
	pos[1] = minion_id.owner.y + lengthdir_y(minion_id.owner.minion_radius,angle);
	
	return pos;
}
