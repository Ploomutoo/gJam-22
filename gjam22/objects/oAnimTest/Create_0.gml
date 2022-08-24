skeleton_animation_set("idle");
skeleton_skin_set("normal");

animList = ds_list_create();
skeleton_animation_list(sprite_index,animList);

skinList = ds_list_create();
skeleton_skin_list(sprite_index,skinList);

aRepeat = 2;
mute = true;
