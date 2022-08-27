event_inherited();

minion_radius = 64;

minion_arr = [];
busy_arr = [];
minion_selected = 0;

//resources
coins = 0;
food = 0;

//counters and tracking
bark = 0
progress = 0;

//spawning minions
repeat(minion_slots)
{	
	var inst = createAt(obj_minion_normal);
	inst.owner = id;
	array_push(minion_arr, inst);
}

//sorting minion array
function minion_sort (_elm1, _elm2)
{
	var sort_type = _elm1.object_index-_elm2.object_index;
	var sort_deployed = (_elm1.state != st.carry) -  (_elm2.state != st.carry);
	var sort_id = _elm1.id-_elm2.id;
    return sort_type*100 + sort_deployed*10 + sort_id;
}
array_sort(minion_arr,minion_sort);

instance_create_layer(0,room_height+600,layer_get_id("dark"),oKillWall);
createAt(obj_ui);
