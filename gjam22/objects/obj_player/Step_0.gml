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

move_force = max_move_force * array_length(minion_arr)/minion_slots;
//z = max(z,move_force*4)
#endregion

event_inherited();

#region abilities

//deploy
if(inp_prim && array_length(minion_arr) > 0)
{	
	if(!audio_is_playing(bark)) bark = audio_play_sound(choose(sndKing1,sndKing3),0,0);
	var target = instance_nearest(mouse_x,mouse_y,obj_interactible);
	if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128)
	{	
		with(minion_arr[minion_selected]) {
			target_obj = noone;
			state = st.move;
			target_x = mouse_x;
			target_y = mouse_y;
		}
	}
	else
	{
		if(target.object_index = obj_pickup || object_is_ancestor(target.object_index,obj_pickup)) {
			
			with(target) {
				
				var placeholder = createAt(obj_placeholder);
				placeholder.sprite_index = sprite_index;
				placeholder.realObj = self;
				
				target = placeholder;
				
				instance_deactivate_object(self);
			}
		}
		minion_arr[minion_selected].target_obj = target;
		minion_arr[minion_selected].state = st.go;

	}
	
	minion_arr[minion_selected].animDir = -1;
	array_push(busy_arr,minion_arr[minion_selected]);
	array_delete(minion_arr,minion_selected,1);
}
//recall
else if(inp_sec)
{	
	if(!audio_is_playing(bark)) bark = audio_play_sound(sndKing2,0,0);
	for(var i = 0; i < array_length(busy_arr); i++)
	{
		var target = busy_arr[i];
		if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > recall_radius) continue;

		if(target.state != st.carry && target.state != st.recall) with(target) {
		
			if(target_obj != noone && target_obj.object_index = obj_placeholder) {
			
				instance_activate_object(target_obj.realObj);
				instance_destroy(target_obj);
			}
			recallFunc();
		}
	}
}
#endregion

//scrolling
minion_selected = clamp(minion_selected, 0, max(array_length(minion_arr)-1, 0));
if(array_length(minion_arr) > 1)
{
	if(mouse_wheel_down()) minCycle(1);
	if(mouse_wheel_up()) minCycle(-1);
}
