/// @description Killed
//if(!instance_exists(id)) exit;

var ix = random(room_width);
var iy = oCamera.y+random(room_width)-room_width/2;

createAt(obj_poof);
//instance_create_layer(ix,iy,layer,object_index);

//Drops
var drop = instance_create_layer(x,y,layer,obj_pickup);
drop.speed = 10
drop.direction = random(360);
drop.dspeed = 5;

soundRand(sndEnemyDie);
instance_destroy();
