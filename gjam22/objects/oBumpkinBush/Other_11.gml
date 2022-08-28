/// @description Killed
createAt(obj_poof);
//instance_create_layer(ix,iy,layer,object_index);

function fDrop() 
{	
	var drop = choose(obj_pickup);
	drop = instance_create_layer(x,y,layer,drop);
	drop.speed = 5
	drop.image_index = 3;
	drop.direction = random(360);
	drop.dspeed = 5;
}

loot = irandom_range(3,5);

//Drops
while(loot>1) {
	loot--;
	fDrop();
} 

soundRand(sndBarrierBreak);
instance_destroy();
