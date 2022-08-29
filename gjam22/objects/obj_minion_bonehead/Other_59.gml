if(state != st.combat || combat_disable) exit;
if(!instance_exists(target_obj)) exit;

var sound = asset_get_index(event_data[? "name"]);
if(audio_exists(sound)) soundRand(sound);

if(sound != sndMinionAtk) exit;

combat_disable = true;

target_obj.hp -= combat_damage;
with(target_obj) event_user(0);

//pushing
var list = ds_list_create();
var count = collision_circle_list(x, y, push_radius, obj_enemy, false, true, list, false);
for(var i = 0; i < count; i++)
{
	var force = lerp(push_force, 0, min(point_distance(x, y, list[|i].x, list[|i].y)/push_radius, 1));
	if(instance_exists(owner))
	{
		var force_dir = point_direction(owner.x, owner.y, list[|i].x, list[|i].y);
	}
	else
	{
		var force_dir = point_direction(x, y, list[|i].x, list[|i].y);
	}
	list[|i].hspeed += lengthdir_x(force, force_dir);
	list[|i].vspeed += lengthdir_y(force, force_dir);
}
ds_list_destroy(list);
