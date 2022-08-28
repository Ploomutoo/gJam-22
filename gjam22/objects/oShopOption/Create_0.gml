var skin = "normal";
switch(irandom(3)){
	case 0:
	saleObj = obj_minion_normal;
	skin = "normal";
	break;
	case 1:
	saleObj = obj_minion_bonehead;
	skin = "bonehead";
	break;
	case 2:
	saleObj = obj_minion_bun;
	skin = "bun";
	break;
	case 3:
	saleObj = obj_minion_crusadile;
	skin = "crusadile";
	break;
}

//sprite_index = object_get_sprite(saleObj);
skeleton_skin_set(skin);

var animList = ds_list_create();

skeleton_animation_list(sprite_index,animList);
skeleton_animation_set(animList[|irandom(ds_list_size(animList)-1)]);

ds_list_destroy(animList);
