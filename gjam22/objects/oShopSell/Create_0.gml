linkedObj = noone;
cost = 3;

var animList = ds_list_create();

skeleton_animation_list(spr_minionSpine,animList);
skeleton_animation_set(animList[|irandom(ds_list_size(animList)-1)]);

ds_list_destroy(animList);

txt = scribble("[fa_center]SELL - 3[spr_item,1]")
hbx = sprite_width/2;
hby = sprite_height/2;
