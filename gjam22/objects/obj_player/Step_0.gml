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

#region minions
//update sorting
/**array_sort(minion_arr, function(_elm1, _elm2)
{
    return (_elm1.state == st.carry) - (_elm2.state == st.carry);
}); */
#endregion

event_inherited();
