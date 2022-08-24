//instance_create_depth(x+64,y,layer,object_index);

var obj = noone;
for(var i = ds_list_size(skinList)-1; i>=0; i--){
	
	var iy = y;
	for(var i2 = i; i2>=3; i2-=3){
		iy+=64;
	}
	var ix = y+96*i2;
	
	obj = instance_create_depth(ix,iy,layer,object_index);
	obj.image_index+=i
	if(i=0) obj.mute = false;
	
	with(obj) skeleton_skin_set(other.skinList[|i]);

}

ds_list_destroy(skinList);
ds_list_destroy(animList);

instance_destroy();
