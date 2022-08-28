soundRand(sndShop);

var playerObj = instance_find(obj_player,0);
money = playerObj.coins
minions = instance_number(obj_minion);
minionCap = playerObj.minion_slots

with(playerObj) {
	
	music = choose(mus42,mus46,mus52,mus58,mus96)
	music = audio_play_sound(music,-3,1);
}

drawX = 1408/2
drawY = 720/2
txt = scribble("[fa_center][fa_middle][scale,2]Welcome to the shop ;)\n"
+"You have [c_yellow]"+string(money)+" dollars[/c]\n"
+"You have "+string(minions)+" [spr_minion,1]minions and a cap of "+string(minionCap)+"\n")
txt.line_spacing(48)

var keepObj = [];

var iCount = irandom_range(2,4)-1;
var ix = drawX*0.75
var iy = drawY-64*iCount

for(var i = iCount; i>=0; i--) {
	array_push(keepObj,instance_create_layer(drawX-ix,iy,layer,oShopOption));
	iy+=128;
}

var iCount = minions-1
var ix = drawX*0.75
var iy = drawY-64*iCount

for(i = iCount; i>=0; i--) {
	array_push(keepObj,instance_create_layer(drawX+ix,iy,layer,oShopSell));
	iy+=128;
}

instance_deactivate_all(true);
for(i = array_length(keepObj)-1; i>=0; i--) {
	
	instance_activate_object(keepObj[i]);
}
