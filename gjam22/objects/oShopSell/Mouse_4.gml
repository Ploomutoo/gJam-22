var obj = oShop.playerObj;

instance_activate_object(obj);
instance_activate_object(linkedObj);

oShop.coins+=cost;
oShop.minions--;
obj.coins+=cost;

soundRand(sndCoin);

if(!instance_exists(linkedObj)) show_debug_message("no linked object");
with(obj) {
	
	var i = arrFindIndex(minion_arr,other.linkedObj);
	if(i>-1) {
		
		array_delete(minion_arr,i,1);
	} else {
		
		i = arrFindIndex(busy_arr,other.linkedObj);
		array_delete(busy_arr,i,1);
	}
}

instance_destroy(linkedObj);
instance_deactivate_object(obj);

instance_destroy();


