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
		var target = instance_nearest(x,y,obj_interactible);
		if(instance_exists(target) && point_distance(x, y, target.x, target.y) <= detect_radius_idle)
		{
			target_obj = target;
			state = st.go;
		}
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
		
			if(point_distance(x, y, target_x, target_y) < target_buffer+target_obj.collision_offset)
			{	
				if(target_obj.object_index=obj_placeholder){
				
					recallFunc();
					item_carry = target_obj;
					item_carry.hide = true;
					soundRand(sndMinionGrab);
				} else if(object_is_ancestor(target_obj.object_index,obj_enemy)){
					
					array_push(target_obj.engaged,id)
					target_obj.inp_move = false;
					
					combat_disable = false;
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
		image_speed = combat_speed;
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
	
	case st.king_dash://--------------------------
		
		anim_to="idle";
		inp_move = false;
	
		if(state_timer < 0)
		{
			state_timer = 30;
		}
		else if(state_timer > 0)
		{
			state_timer -= 1;
		}
		
		if(state_timer = 0)
		{
			state_timer = -1;
			recallFunc();
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

//setting aim
inp_aim = inp_dir;

event_inherited();
