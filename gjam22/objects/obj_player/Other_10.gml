if(iFrames>0) exit;

hp--;
if(hp>0) {
	
	soundRand(sndKingHurt);
	iFrames = 30;
} else {
	
	room_goto(rm_dead);
	for(var i = array_length(minion_arr)-1; i>=0; i--){
		
		instance_destroy(minion_arr[i]);
	}
	for(i = array_length(busy_arr)-1; i>=0; i--){
		
		instance_destroy(busy_arr[i]);
	}
	audio_stop_sound(music);
	instance_destroy();
}
