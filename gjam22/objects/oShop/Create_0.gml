soundRand(sndShop);

playerObj = instance_find(obj_player,0);
coins = playerObj.coins
minions = instance_number(obj_minion);
minionCap = playerObj.minion_slots

with(playerObj) {
	
	music = choose(mus42,mus46,mus52,mus58,mus96)
	music = audio_play_sound(music,-3,1);
}

drawX = 1408/2
drawY = 720/2
txt = scribble("[fa_center][fa_middle][scale,2]Welcome to the shop ;)\n"
+"You have [c_yellow]"+string(coins)+" dollars[/c]\n"
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

var minionList = [];
array_copy(minionList,0,playerObj.minion_arr,0,array_length(playerObj.minion_arr))
array_copy(minionList,array_length(minionList),playerObj.busy_arr,0,array_length(playerObj.busy_arr))

var iCount = array_length(minionList)-1
var ix = drawX*0.75
var iy = drawY-64*iCount

function getSkin(target) {
	with(target) return(skeleton_skin_get());
}

for(i = iCount; i>=0; i--) {
	var shopObj = instance_create_layer(drawX+ix,iy,layer,oShopSell)
	array_push(keepObj,shopObj);
	shopObj.linkedObj = minionList[i];
	with(shopObj) {
		skeleton_skin_set(getSkin(linkedObj))
	}
	iy+=128;
}

instance_deactivate_all(true);
for(i = array_length(keepObj)-1; i>=0; i--) {
	
	instance_activate_object(keepObj[i]);
}
