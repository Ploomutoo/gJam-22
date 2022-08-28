if(room!=rm_game) exit;

audio_stop_sound(music);
music = choose(mus18,mus19,mus33,mus4,mus67,mus71)
music = audio_play_sound(music,0,1);

y = room_height;
x = room_width/2;
win = false;

oCamera.mouseLastX = x;
oCamera.mouseLastY = y;

with(obj_minion) {
	
	x = other.x;
	y = other.y;
}
instance_create_layer(0,room_height+600,layer_get_id("dark"),oKillWall);
createAt(obj_ui);
