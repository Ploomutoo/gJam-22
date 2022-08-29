mask_index = spr_shopBox;

var skin = "normal";
cost = 5
switch(irandom(4)){
	case 0:
	saleObj = obj_minion_normal;
	skin = "normal";
	break;
	case 1:
	saleObj = obj_minion_bonehead;
	skin = "bonehead";
	cost = 8;
	break;
	case 2:
	saleObj = obj_minion_bun;
	skin = "bun";
	cost = 7;
	break;
	case 3:
	saleObj = obj_minion_crusadile;
	skin = "crusadile";
	cost = 10;
	break;
	case 4:
	saleObj = obj_minion_orc;
	skin = "orc";
	cost = 10;
	break;
}

//sprite_index = object_get_sprite(saleObj);
skeleton_skin_set(skin);

var animList = ds_list_create();

skeleton_animation_list(sprite_index,animList);
skeleton_animation_set(animList[|irandom(ds_list_size(animList)-1)]);

ds_list_destroy(animList);

txt = scribble("[fa_center]BUY - "+string(cost)+"[spr_item,1]")
