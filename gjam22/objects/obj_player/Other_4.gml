y = room_height;
x = room_width/2;
win = false;

with(obj_minion) {
	
	x = other.x;
	y = other.y;
}
instance_create_layer(0,room_height+600,layer_get_id("dark"),oKillWall);
createAt(obj_ui);
