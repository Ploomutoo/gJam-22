if(state != st.combat || combat_disable) exit;
if(!instance_exists(target_obj)) exit;

var sound = asset_get_index(event_data[? "name"]);
if(audio_exists(sound)) soundRand(sound);

if(sound != sndMinionAtk) exit;
//show_debug_message("attack target "+object_get_name(target_obj.object_index));

//show_debug_message("atk")
combat_disable = true;

target_obj.hp -= combat_damage;
with(target_obj) event_user(0);
