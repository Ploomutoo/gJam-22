if(oShop.coins>=cost) {
	
	oShop.coins-=cost;
	oShop.minions++;
	soundRand(sndCoin);
	
	var obj = oShop.playerObj;
	instance_activate_object(obj);
	with(obj) {
		
		coins-=other.cost;
		instance_deactivate_object(addMinion(other.saleObj));
	}
	instance_deactivate_object(obj);
	instance_destroy();
}
