var target = instance_nearest(mouse_x,mouse_y,obj_interactible);
if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128)
{
	target = instance_create_layer(mouse_x,mouse_y,layer,obj_rally);
}

minion_arr[minionOn].target_obj = target;
minion_arr[minionOn].state = st.attack;
