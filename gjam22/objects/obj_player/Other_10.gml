if(iFrames>0) exit;

hp--;
if(hp>0) {
	
	soundRand(sndKingHurt);
	iFrames = 30;
} else {
	
	//Memory 
	if(instance_number(obj_minion)>instance_number(obj_minion_normal)) {
		
		var savedUnit = obj_minion_normal;
		while(savedUnit=obj_minion_normal) {
			
			savedUnit = instance_find(obj_minion,irandom(instance_number(obj_minion)-1)).object_index;
		
		}
		ini_open("unitMemory");
		ini_write_real("unit","unit",savedUnit)
		ini_close();
		
	} else show_debug_message("lame")
	
	room_goto(rm_dead);
	for(var i = array_length(minion_arr)-1; i>=0; i--){
		
		instance_destroy(minion_arr[i]);
	}
	for(i = array_length(busy_arr)-1; i>=0; i--){
		
		instance_destroy(busy_arr[i]);
	}
	audio_stop_sound(music);
	instance_destroy(obj_game);
	instance_destroy();
}
