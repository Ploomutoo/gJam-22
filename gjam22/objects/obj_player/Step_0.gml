if(win) {
	
	vspeed = -5
	if(!audio_is_playing(bark)) room_goto(rm_shop);	
	
	exit;
}

#region setting inputs
var mlx = oCamera.mouseLastX;
var mly = oCamera.mouseLastY;

inp_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
inp_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
inp_move = abs(inp_x) || abs(inp_y);
inp_dir = point_direction(0, 0, inp_x, inp_y);
inp_aim = point_direction(x, y, mlx, mly);
inp_prim = mouse_check_button_pressed(mb_left);
inp_sec = mouse_check_button_pressed(mb_right);
inp_dash = keyboard_check_pressed(vk_space);

#endregion

#region setting carry speed

move_force = max_move_force * array_length(minion_arr)/minion_slots;
#endregion

//dash
if(inp_dash && z <= 0)
{
	var minion_full = array_length(minion_arr)/minion_slots;
	//setting dash direction
	var dash_dir = inp_aim;
	if(inp_move)
	{
		dash_dir = inp_dir;
	}
	
	//applying speed
	var dash_height = 5;
	var dash_speed = 25;
	dspeed = dash_height * minion_full;
	hspeed += lengthdir_x(dash_speed * minion_full, dash_dir);
	vspeed += lengthdir_y(dash_speed * minion_full, dash_dir);
	
	//deploying all followers
	for(var i = array_length(minion_arr)-1; i >= 0; i--)
	{
		minion_arr[i].state = st.king_dash;
		array_push(busy_arr, minion_arr[i]);
		array_delete(minion_arr, i, 1);
	}
	
	//playing sound
	soundRand(sndKingDash);
}

//setting old air position
old_z = z;

event_inherited();

//playing land sound
if(old_z > 0 && z <= 0)
{
	soundRand(sndKingLand);
}

#region abilities

//deploy
if(inp_prim && array_length(minion_arr) > 0)
{	
	audio_stop_sound(bark);
	bark = audio_play_sound(choose(sndKing1,sndKing2),0,0);
	image_speed = 1;
	skeleton_animation_set("command");
	
	var target = instance_nearest(mlx,mly,obj_interactible);
	//moving to empty position
	if(target = noone || point_distance(mlx,mly,target.x,target.y) > 128)
	{	
		with(minion_arr[minion_selected]) {
			target_obj = noone;
			state = st.move;
			target_x = mlx;
			target_y = mly;
		}
	}
	else
	{
		//if a pickup
		if(target.object_index = obj_pickup || object_is_ancestor(target.object_index,obj_pickup)) {
			
			with(target) {
				
				var placeholder = createAt(obj_placeholder);
				placeholder.sprite_index = sprite_index;
				placeholder.image_index = image_index;
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
	with(obj_ui) {
		drawCirc = 60;
		dcx = mlx;
		dcy = mly;
		dcr = other.recall_radius;
	}
	
	audio_stop_sound(bark);
	bark = audio_play_sound(sndKing3,0,0);
	image_speed = 1;
	skeleton_animation_set("command");
	
	for(var i = 0; i < array_length(busy_arr); i++)
	{
		var target = busy_arr[i];
		if(target = noone || point_distance(mlx,mly,target.x,target.y) > recall_radius) continue;

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
if(iFrames>0) iFrames--;

if(inp_move && (skeleton_animation_get()="default" || skeleton_animation_get()="move")) walkSet();
progress = clamp(y/room_height,0,1)
if(y<-128) {
	
	iFrames = 1;
	win = true;
	bark = soundRand(sndWin);
}
