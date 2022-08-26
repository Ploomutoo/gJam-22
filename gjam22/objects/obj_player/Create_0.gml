event_inherited();

//stats
minion_slots = 7;
minion_radius = 64;

minion_arr = [];
busy_arr = [];
minion_selected = 0;
recall_radius = 128;

max_move_force = 0.5;
bark = 0

coins = 0;
food = 0;
progress = 0;

//sorting minion array
function minion_sort (_elm1, _elm2)
{
	var sort_type = _elm1.object_index-_elm2.object_index;
	var sort_deployed = (_elm1.state != st.carry) -  (_elm2.state != st.carry);
	var sort_id = _elm1.id-_elm2.id;
    return sort_type*100 + sort_deployed*10 + sort_id;
}

//spawning minions
repeat(minion_slots)
{	
	var inst = createAt(choose(obj_minion_bonehead, obj_minion_bun, obj_minion_crusadile, obj_minion));
	inst.owner = id;
	array_push(minion_arr, inst);
}

array_sort(minion_arr,minion_sort);
instance_create_layer(0,room_height+600,layer_get_id("dark"),oKillWall);
createAt(obj_ui);
