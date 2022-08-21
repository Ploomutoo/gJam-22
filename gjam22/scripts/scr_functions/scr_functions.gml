function createAt(object){
	return(instance_create_layer(x,y,layer,object));
}

/*
function minionMount(minionIndex,minionNum) {
	
	var mountAngle = minionIndex*360/minionNum;
	
	var xDir = lengthdir_x(obj_player.radius+16,mountAngle);
	xDir = clamp(xDir,-obj_player.radius,obj_player.radius);
	
	var yDir = lengthdir_y(obj_player.radius+16,mountAngle);
	yDir = clamp(yDir,-obj_player.radius,obj_player.radius);
	
	x = obj_player.x+xDir;
	y = obj_player.y+yDir;
	
}

function mountAng(minionIndex,minionNum) {
	
	var mountAngle = minionIndex*360/minionNum;
	
	var xDir = lengthdir_x(obj_player.radius+16,mountAngle);
	xDir = clamp(xDir,-obj_player.radius,obj_player.radius);
	
	var yDir = lengthdir_y(obj_player.radius+16,mountAngle);
	yDir = clamp(yDir,-obj_player.radius,obj_player.radius);
	
	return(point_direction(x,y,obj_player.x+xDir,obj_player.y+yDir));
	
}
*/

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
	pos[0] = minion_id.owner.x + lengthdir_x(minion_id.owner.minion_radius, angle);
	pos[1] = minion_id.owner.y + lengthdir_y(minion_id.owner.minion_radius, angle);
	
	return pos;
}
