/// @description Killed
createAt(obj_poof);
//instance_create_layer(ix,iy,layer,object_index);

function fDrop() 
{	
	var drop = choose(obj_pickup);
	drop = instance_create_layer(x,y,layer,drop);
	drop.speed = 10
	drop.direction = random(360);
	drop.dspeed = 5;
}

//Drops
while(loot>1) {
	fDrop();
} 

if(loot>random(1)) fDrop();

soundRand(sndEnemyDie);
instance_destroy();
