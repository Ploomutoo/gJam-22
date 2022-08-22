/*with(obj_player) {
	
	var i = array_length(minion_arr)-1;
	while(i>=0) {
		
		if(i=minion_selected) draw_sprite(spr_minion_selected,0,16+32*i,16)
		
		var col = c_white;
		if(minion_arr[i].state != st.carry) col = c_grey;
		
		draw_sprite_ext(spr_minion,0,16+32*i,32,1,1,0,col,1)
		i--
	}
}*/

with(obj_player)
{
	var gui_x = 32;
	var gui_y = 32;
	var h_space = 12;
	var v_space = sqrt(h_space*h_space + h_space*h_space*2);
	var v_alt = false;
	var type_space = 64;
	for(var i = 0; i < array_length(minion_arr); i++)
	{
		//checking for change in type
		if(minion_arr[max(0, i-1)].object_index != minion_arr[i].object_index)
		{
			draw_sprite(spr_bar_divider, 0, gui_x+(h_space*(i-1))+(type_space/2), gui_y+(v_space/2));
			gui_x += type_space-h_space;
			v_alt = false;
		}
		//drawing sprites
		var col = c_white;
		if(minion_arr[i].state != st.carry) 
		{
			var col = c_grey;
		}
		draw_sprite_ext(spr_minion, 0, gui_x+h_space*i, gui_y+v_space*v_alt, 1, 1, 0, col, 1);
		v_alt = !v_alt;
	}
}
