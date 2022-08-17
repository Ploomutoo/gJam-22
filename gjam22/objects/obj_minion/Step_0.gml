inp_move = false;
inp_dir = 0;

switch state
{
	case st.carry:
	minionMount(minionIndex,obj_player.minion_slots);
	
	break;
	
	case st.idle:
	break;
	
	case st.fetch:
	break;
	
	case st.attack:
	if(instance_exists(target_obj))
	{
		inp_move = true;
		inp_dir = point_direction(x,y,target_obj.x,target_obj.y);
	}
	else state = st.recall;	
	break;
	
	case st.recall:
	inp_move = true;
	inp_dir = mountAng(minionIndex,obj_player.minion_slots);
	
	break;
}

event_inherited();
