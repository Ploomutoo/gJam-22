with(obj_player) {
	
	//Minion Array
	draw_set_halign(fa_center);
	var i = minion_slots-1;
	var i2 = array_length(minion_arr)-1;
	var hOffset = 16;
	
	draw_sprite_ext(spr_ui_backing,0,32,hOffset,1,minion_slots,0,c_white,1);
	draw_text(32,hOffset+36+32*i,string(floor((i2+1)/(i+1)*100))+"%");
	while(i>=0) {
		
		if(i>i2) draw_sprite(spr_minion,0,32,hOffset+16+32*i);
		else if(i=minion_selected) draw_sprite(spr_minion_highlight,minion_arr[i].headSprite,32,hOffset+16+32*i);
		else
		{
			var col = c_white;
			if(minion_arr[i].state != st.carry) col = c_grey;
		
			draw_sprite_ext(spr_minion,minion_arr[i].headSprite,32,hOffset+16+32*i,1,1,0,col,1);
		}
		i--
	}
	
	ix = 32;
	i = oCamera.camHeight-32
	draw_sprite(spr_item,4,ix,i-4);
	draw_text(ix,i,string(food)+"/"+string(5*level));
	
	i-=64
	draw_sprite(spr_item,1,ix,i-4);
	draw_text(ix,i,string(coins));
		
	var ix = 1344+32; //Width 64
	hOffset=16
	var barHeight = (oCamera.camHeight-hOffset*2)/32
	draw_sprite_ext(spr_ui_backing,0,ix,hOffset,0.5,barHeight,0,c_white,1);
	
	draw_sprite(spr_ui_crown,0,ix,hOffset+barHeight*32*progress);
	if(oKillWall.progress>0) draw_sprite(spr_ui_crown,1,ix,hOffset+barHeight*32*oKillWall.progress);
	
	ix = 1408/2-16*max_hp
	i = hp;
	repeat(max_hp) {
		if(i>0) draw_sprite(spr_hearts,0,ix,48);
		else draw_sprite(spr_hearts,1,ix,48);
		ix+=32;
		i--;
	}
	
}
