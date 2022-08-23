/*function minCycle(add){
	
	var minStart = minion_selected;
	var minCount = array_length(minion_arr)-1;
	
	minion_selected+=add;
	
	if(minion_selected<0) minion_selected = minCount;
	if(minion_selected>=minCount) minion_selected = 0;
	
	while(minion_arr[minion_selected].state!=st.carry){
		minion_selected--;
		if(minion_selected<0) minion_selected = array_length(minion_arr)-1;
		
		if(minion_selected = minStart) break;
	}
}

function minion_type_cycle(_add)
{
	repeat(abs(_add))
	{
		var start_type = minion_arr[minion_selected].object_index;
		var start_id = minion_arr[minion_selected].id;
		do
		{
			minion_selected += sign(_add);
			if(minion_selected < 0)
			{
				
			}
		}
		until(minion_arr[minion_selected].object_index != start_type || minion_arr[minion_selected].id = start_id)
	}
}
