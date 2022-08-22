#region setting inputs
inp_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
inp_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
inp_move = abs(inp_x) || abs(inp_y);
inp_dir = point_direction(0, 0, inp_x, inp_y);
inp_aim = point_direction(x, y, mouse_x, mouse_y);
inp_prim = mouse_check_button_pressed(mb_left);
inp_sec = mouse_check_button_pressed(mb_right);

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

//sorting minion array
array_sort(minion_arr, function(_elm1, _elm2)
{
	var sort_type = _elm1.object_index-_elm2.object_index;
	var sort_deployed = (_elm1.state != st.carry) -  (_elm2.state != st.carry);
	var sort_id = _elm1.id-_elm2.id;
    return sort_type*100 + sort_deployed*10 + sort_id;
});

#region abilities
//deploy
if(inp_prim)
{
	var target = instance_nearest(mouse_x,mouse_y,obj_interactible);
	if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128)
	{
		minion_arr[minion_selected].target_obj = noone;
		minion_arr[minion_selected].state = st.move;
		minion_arr[minion_selected].target_x = mouse_x;
		minion_arr[minion_selected].target_y = mouse_y;
	}
	else
	{
		minion_arr[minion_selected].target_obj = target;
		minion_arr[minion_selected].state = st.go;

	}
	minCycle(1);
	
}
//recall
else if(inp_sec)
{
	var target = instance_nearest(mouse_x,mouse_y,obj_minion);
	if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128) exit;

	if(target.state != st.carry) target.state = st.recall;
}
#endregion

if(mouse_wheel_down()) minCycle(1);
if(mouse_wheel_up()) minCycle(-1);
