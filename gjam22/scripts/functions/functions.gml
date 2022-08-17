function createAt(object){
	return(instance_create_layer(x,y,layer,object));
}

function minionMount(minionIndex,minionNum) {
	
	var mountAngle = minionIndex*360/minionNum;
	
	var xDir = lengthdir_x(obj_player.radius+16,mountAngle)
	xDir = clamp(xDir,-obj_player.radius,obj_player.radius);
	
	var yDir = lengthdir_y(obj_player.radius+16,mountAngle)
	yDir = clamp(yDir,-obj_player.radius,obj_player.radius);
	
	x = approach(x,obj_player.x+xDir,moveSpeed);
	y = approach(y,obj_player.y+yDir,moveSpeed)
	
}

function mountAng(minionIndex,minionNum) {
	
	var mountAngle = minionIndex*360/minionNum;
	
	var xDir = lengthdir_x(obj_player.radius+16,mountAngle)
	xDir = clamp(xDir,-obj_player.radius,obj_player.radius);
	
	var yDir = lengthdir_y(obj_player.radius+16,mountAngle)
	yDir = clamp(yDir,-obj_player.radius,obj_player.radius);
	
	return(point_direction(x,y,obj_player.x+xDir,obj_player.y+yDir))
	
}
