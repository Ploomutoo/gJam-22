inp_move = false;
inp_dir = 0;

if(instance_exists(target_obj))
{
	target_x = target_obj.x;
	target_y = target_obj.y;
}

#region state machine
switch state
{
	case st.carry:
	var mount_pos = minion_mount_pos(id);
	x = mount_pos[0];
	y = mount_pos[1];
	break;
	
	case st.idle:
	break;
	
	case st.move:
	inp_move = true;
	inp_dir = point_direction(x,y,target_x,target_y);
	break;
	
	case st.fetch:
	break;
	
	case st.attack:
	if(instance_exists(target_obj))
	{
		inp_move = true;
		inp_dir = point_direction(x,y,target_x,target_y);
		
		if(point_distance(x, y, target_x, target_y) < target_buffer)
		{
			state = st.idle;
		}
	}
	else state = st.recall;	
	break;
	
	case st.recall:
	inp_move = true;
	var mount_pos = minion_mount_pos(id);
	inp_dir = point_direction(x, y, mount_pos[0], mount_pos[1]);
	if(point_distance(x, y, mount_pos[0], mount_pos[1]) < target_buffer)
	{
		state = st.carry;
	}
	break;
}
#endregion

//wiggle
wiggle_timer += wiggle_speed;
if(inp_move)
{
	var wiggle_val = smooth_noise_2d(wiggle_amt*-0.5, wiggle_amt*0.5, wiggle_timer, 0, 1, id);
	inp_dir += wiggle_val;
}

event_inherited();
