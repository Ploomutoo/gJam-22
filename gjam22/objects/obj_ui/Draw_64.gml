with(obj_player) {
	
	var i = array_length(minion_arr)-1;
	while(i>=0) {
		
		if(i=minionOn) draw_sprite(spr_minionOn,0,16+32*i,16)
		
		var col = c_white;
		if(minion_arr[i].state != st.carry) col = c_grey;
		
		draw_sprite_ext(minion_arr[i].sprite_index,0,16+32*i,32,1,1,0,col,1)
		i--
	}
}
