#region setting inputs
inp_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
inp_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
inp_move = abs(inp_x) || abs(inp_y);
inp_dir = point_direction(0, 0, inp_x, inp_y);

if(keyboard_check_pressed(vk_space) && z <= 0)
{
	dspeed = 5;
}
#endregion
event_inherited();

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

