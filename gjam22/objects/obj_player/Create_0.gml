event_inherited();

//stats
minion_slots = 3;
minion_radius = max(sprite_get_bbox_right(sprite_index)-sprite_get_bbox_left(sprite_index), sprite_get_bbox_top(sprite_index)-sprite_get_bbox_bottom(sprite_index))/2;

minion_arr = [];
minionOn = 0;

max_move_force = 1;

//spawning minions
repeat(minion_slots)
{
	var inst = createAt(obj_minion);
	inst.owner = id;
	array_push(minion_arr, inst);
}

createAt(obj_ui);
