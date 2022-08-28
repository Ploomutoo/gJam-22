function textPopup(ix,iy,text) {

	var obj = instance_create_layer(ix,iy,layer,oPopupText);
	with(obj) txt = scribble("[fa_center][scale,1.5]"+text);

}

function minCycle(add){
	
	soundRand(sndUiClick);
	
	var minStart = minion_selected;
	var minCount = array_length(minion_arr)-1;
	
	minion_selected+=sign(add);
	
	if(minion_selected<0) minion_selected = minCount;
	else if(minion_selected>minCount) minion_selected = 0;
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
