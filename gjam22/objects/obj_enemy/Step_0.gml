inp_dir = point_direction(x,y,target.x,target.y)
if(array_length(engaged)<1) inp_move = true;

if(z=0) dspeed=2;

//wiggle
wiggle_timer += wiggle_speed;
if(inp_move)
{
	var wiggle_val = smooth_noise_2d(wiggle_amt*-0.5, wiggle_amt*0.5, wiggle_timer, 0, 1, id);
	inp_dir += wiggle_val;
}

//setting aim
inp_aim = inp_dir;

event_inherited();

