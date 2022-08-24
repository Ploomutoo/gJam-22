if(aRepeat>1) {

	aRepeat-=1;
	exit;
} else aRepeat = 2;

var i = ds_list_find_index(animList,skeleton_animation_get());

if(skeleton_animation_get()="attackw" && image_xscale = 1){
	
	image_xscale = -1;
	
} else {
	
	if(i=ds_list_size(animList)-1) i = 0;
	else i++;
	
	image_xscale = 1;
}

skeleton_animation_set(animList[|i]);
