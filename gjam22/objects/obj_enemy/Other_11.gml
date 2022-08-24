/// @description Killed
//if(!instance_exists(id)) exit;

var ix = random(room_width);
var iy = random(room_height);

instance_create_layer(ix,iy,layer,object_index);

//Drops
var drop = instance_create_layer(x,y,layer,obj_pickup);
drop.speed = 10
drop.direction = random(360);
drop.dspeed = 5;

soundRand(sndEnemyDie);
instance_destroy();
