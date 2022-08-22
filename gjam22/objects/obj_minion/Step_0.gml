inp_move = false;
inp_dir = 0;
anim_to = ""; //animation to set to at the end of step, 
//will be based on movement if not overridden prior

if(instance_exists(target_obj))
{
	target_x = target_obj.x;
	target_y = target_obj.y;
}

#region state machine
switch state
{
	case st.carry://--------------------------
	var mount_pos = minion_mount_pos(id);
	x = mount_pos[0];
	y = mount_pos[1];
	
	anim_to = "walks";
	break;
	
	case st.idle://--------------------------
	anim_to = "walks";
	break;
	
	case st.move://--------------------------
	inp_move = true;
	inp_dir = point_direction(x,y,target_x,target_y);
	
	if(point_distance(x, y, target_x, target_y) < target_buffer)
	{
		state = st.idle;
	}
	break;
	
	case st.go://--------------------------
	if(instance_exists(target_obj))
	{
		inp_move = true;
		inp_dir = point_direction(x,y,target_x,target_y);
		
		if(point_distance(x, y, target_x, target_y) < target_buffer)
		{	

			if(target_obj.object_index=obj_pickup){
				
				state = st.recall;
				item_carry = target_obj;
				item_carry.hide = true;
			} else if(target_obj.object_index=obj_enemy){
						
				state = st.combat;
				combat_counter = 1;
			}
			
		}
	}
	else state = st.recall;	
	break;
	
	case st.combat://--------------------------
	
	if(!instance_exists(target_obj)) {
		
		state = st.recall;
		target_obj = noone;
		break;
	}
	
	combat_counter--;
	if(combat_counter=0){
		
		combat_counter = combat_interval;
		target_obj.hp -= combat_damage;
		soundRand(sndCombat);
		with(target_obj) event_user(0);
	}
	break;
	
	case st.recall://--------------------------
	inp_move = true;
	var mount_pos = minion_mount_pos(id);
	inp_dir = point_direction(x, y, mount_pos[0], mount_pos[1]);
	
	if(item_carry!=noone){
		item_carry.x = x;
		item_carry.y = y+1;		
	}
	
	if(point_distance(x, y, mount_pos[0], mount_pos[1]) < target_buffer)
	{
		state = st.carry;
		with(item_carry) {
			
			event_user(0);
			instance_destroy();
		}
		item_carry = noone;
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

#region animation
if(anim_to="") {

	var ad = round(inp_dir/90);
	if(animDir!=ad) {
	
		animDir = ad;
		switch(animDir) {
		
			case 0:
			case 4:
			skelSet("walke");
			break;
			case 1:
			skelSet("walkn");
			break;
			case 2:
			skelSet("walkw");
			break;
			case 3:
			skelSet("walks");
			break;
		}
	}
} else skelSet(anim_to);
#endregion

event_inherited();
