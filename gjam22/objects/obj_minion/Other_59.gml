if(state != st.combat) exit;
if(!instance_exists(target_obj)) exit;

//show_debug_message("attack target "+object_get_name(target_obj.object_index));
soundRand(sndCombat);

target_obj.hp -= combat_damage;
with(target_obj) event_user(0);
