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
	
		anim_to = "idle";
		var mount_pos = minion_mount_pos(id);
		x = lerp(x,mount_pos[0],0.2);
		y = lerp(y,mount_pos[1],0.2);
		
	break;
	
	case st.idle://--------------------------
	
		anim_to = "guard";
	break;
	
	case st.move://--------------------------
		
		anim_to="";
		inp_move = true;
		inp_dir = point_direction(x,y,target_x,target_y);
	
		if(point_distance(x, y, target_x, target_y) < target_buffer)
		{
			state = st.idle;
		}
		
	break;
	
	case st.go://--------------------------
		
		anim_to="";
		if(instance_exists(target_obj))
		{
			inp_move = true;
			inp_dir = point_direction(x,y,target_x,target_y);
		
			if(point_distance(x, y, target_x, target_y) < target_buffer)
			{	
				if(target_obj.object_index=obj_placeholder){
				
					recallFunc();
					item_carry = target_obj;
					item_carry.hide = true;
				} else if(target_obj.object_index=obj_enemy){
						
					state = st.combat;
					image_speed = combat_speed;
				}
			
			}
		}
		else recallFunc();	
		
	break;
	
	case st.combat://--------------------------
	
		if(!instance_exists(target_obj)) {
		
			recallFunc();
			image_xscale = 1;
			image_speed = 1;
			target_obj = noone;
			break;
		}
	
		anim_to = "attackw";
		if(target_obj.x > x) image_xscale = -1;
		else image_xscale = 1;
	
	break;
	
	case st.recall://--------------------------
	
		inp_move = true;
		//var mount_pos = minion_mount_pos(id);
		var mount_pos = [owner.x, owner.y];
	
		inp_dir = point_direction(x, y, mount_pos[0], mount_pos[1]);
	
		if(point_distance(x, y, mount_pos[0], mount_pos[1]) < owner.minion_radius)
		{ //Exit to Carry
			state = st.carry;
			with(item_carry) {
			
				with(realObj) {
				
					event_user(0);
					instance_destroy();
				}
				instance_destroy();
			}
			item_carry = noone;
		
			with(obj_player) {
		
				array_delete(busy_arr,array_find_index(busy_arr,other.id),1);
				array_push(minion_arr,other.id);
				array_sort(minion_arr,minion_sort);
			}
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
if(anim_to = "") {

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
			default:
			show_debug_message("error")
			break;
		}
	}
} else skelSet(anim_to);
#endregion

event_inherited();
