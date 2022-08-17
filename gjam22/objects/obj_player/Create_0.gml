event_inherited();

//stats
minion_slots = 3;
radius = 45;

minion_arr = [];
minionOn = 0;

//spawning minions
repeat(minion_slots)
{
	var inst = createAt(obj_minion);
	inst.owner = id;
	inst.minionIndex = array_length(minion_arr);
	
	array_push(minion_arr, inst);
}

createAt(obj_ui);
