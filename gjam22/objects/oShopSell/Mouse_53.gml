if(!point_in_rectangle(mouse_x,mouse_y,x+hbx,y+hby,x-hbx,y-hby)) exit;

var obj = oShop.playerObj;

instance_activate_object(obj);
instance_activate_object(linkedObj);

oShop.coins+=cost;
oShop.minions--;
obj.coins+=cost;

soundRand(sndCoin);

if(!instance_exists(linkedObj)) show_debug_message("no linked object");
with(obj) {
	
	var i = array_find_index(minion_arr,other.linkedObj);
	if(i>-1) {
		
		array_delete(minion_arr,i,1);
	} else {
		
		i = array_find_index(busy_arr,other.linkedObj);
		array_delete(busy_arr,i,1);
	}
}

instance_destroy(linkedObj);
instance_deactivate_object(obj);

instance_destroy();


