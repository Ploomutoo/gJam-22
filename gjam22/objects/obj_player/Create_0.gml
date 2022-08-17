event_inherited();

//stats
minion_slots = 3;
//minion_arr = [];

//spawning minions
repeat(minion_slots)
{
	var inst = instance_create_layer(x, y, layer, obj_minion);
	
	inst.owner = id;
	//array_push(minion_arr, inst);
}
