/*var ix = random(room_width);
var iy = random(room_height);

instance_create_layer(ix,iy,layer,object_index);*/

if(valMoney>0) {
	
	soundRand(sndCoin);
	obj_player.coins+=valMoney;
}

if(valFood>0) {
	
	soundRand(sndFood);
	obj_player.food+=valFood;
	
	with(obj_player) foodCalc();
}

