/// @description Killed
createAt(obj_poof);
//instance_create_layer(ix,iy,layer,object_index);

function fDrop() 
{	
	var drop = choose(obj_p_food, obj_p_coins);
	
	var hpChance = (1-obj_player.hp/obj_player.max_hp)/2
	//show_debug_message("healthchance is "+string(hpChance));
	
	if(hpChance>random(1)) drop = obj_p_health;
	
	drop = instance_create_layer(x,y,layer,drop);
	drop.speed = 10
	drop.direction = random(360);
	drop.dspeed = 5;
}

//Drops
while(loot>1) {
	loot--;
	fDrop();
} 

if(loot>random(1)) fDrop();

soundRand(deathSound);
instance_destroy();
