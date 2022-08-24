draw_set_color(c_black); draw_set_alpha(0.3);
draw_rectangle(0,0,room_width,uiBottom,0);
draw_set_color(c_white); draw_set_alpha(1);

with(obj_player) {
	
	//Minion Array
	var i = minion_slots-1;
	var i2 = array_length(minion_arr)-1;
	var hOffset = 16;
	
	draw_sprite_ext(spr_ui_backing,0,hOffset,32,minion_slots,1,0,c_white,1);
	draw_text(hOffset+36+32*i,22,string(floor(move_force*100))+"%");
	while(i>=0) {
		
		if(i>i2) draw_sprite(spr_minion,0,hOffset+16+32*i,32);
		else if(i=minion_selected) draw_sprite(spr_minion_highlight,minion_arr[i].headSprite,hOffset+16+32*i,30);
		else
		{
			var col = c_white;
			if(minion_arr[i].state != st.carry) col = c_grey;
		
			draw_sprite_ext(spr_minion,minion_arr[i].headSprite,hOffset+16+32*i,32,1,1,0,col,1);
		}
		i--
	}
	
	//Busy Array
	i = array_length(busy_arr)-1;
	while(i>=0) {
		
		draw_sprite(spr_minion,busy_arr[i].headSprite,hOffset+16+32*i,64);
		i--
	}
}

/*
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
*/
