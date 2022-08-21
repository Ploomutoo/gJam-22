#region setting inputs
inp_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
inp_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
inp_move = abs(inp_x) || abs(inp_y);
inp_dir = point_direction(0, 0, inp_x, inp_y);
inp_aim = point_direction(x, y, mouse_x, mouse_y);
inp_prim = mouse_check_button(mb_left);
inp_sec = mouse_check_button(mb_right);

if(keyboard_check_pressed(vk_space) && z <= 0)
{
	dspeed = 5;
}
#endregion

#region setting carry speed
var carry_minions = 0;
for(var i = 0; i < array_length(minion_arr); i++)
{
	if(minion_arr[i].state = st.carry)
	{
		carry_minions += 1;
	}
}
move_force = max_move_force * carry_minions/array_length(minion_arr);
#endregion

event_inherited();

#region abilities
//deploy
if(inp_prim)
{
	var target = instance_nearest(mouse_x,mouse_y,obj_interactible);
	if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128)
	{
		minion_arr[minionOn].target_obj = noone;
		minion_arr[minionOn].state = st.move;
		minion_arr[minionOn].target_x = mouse_x;
		minion_arr[minionOn].target_y = mouse_y;
	}
	else
	{
		minion_arr[minionOn].target_obj = target;
		if(target.object_index = obj_enemy || object_is_ancestor(target, obj_enemy))
		{
			minion_arr[minionOn].state = st.attack;
		}
		else
		{
			minion_arr[minionOn].state = st.fetch;
		}
	}
}
//recall
else if(inp_sec)
{
	var target = instance_nearest(mouse_x,mouse_y,obj_minion);
	if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128) exit;

	if(target.state != st.carry) target.state = st.recall;
}
#endregion

#region minion selection
var minStart = minionOn;
if(mouse_wheel_down()) {
	minionOn++;
	if(minionOn>=minion_slots) minionOn = 0;
	
	while(minion_arr[minionOn].state!=st.carry){
		minionOn++;
		if(minionOn>=minion_slots) minionOn = 0;
		
		if(minionOn = minStart) break;
	}
}
if(mouse_wheel_up()) {
	minionOn--;
	if(minionOn<0) minionOn = array_length(minion_arr)-1;
	
	while(minion_arr[minionOn].state!=st.carry){
		minionOn--;
		if(minionOn<0) minionOn = array_length(minion_arr)-1;
		
		if(minionOn = minStart) break;
	}
}
#endregion
