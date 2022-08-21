//apply gravity
z += dspeed;
if(z > 0)
{
	dspeed -= grav;
}
else
{
	z = 0;
	dspeed = 0;
}

//apply drag
if(z > 0)
{
	speed = approach(speed, 0, air_drag*speed);
}
else
{
	speed = approach(speed, 0, drag*speed);
}

//apply movement
var move_final = move_force;
if(z > 0)
{
	var air_move_force = move_force * (air_drag / drag);
	move_final = air_move_force;
}
hspeed += lengthdir_x(move_final, inp_dir)*inp_move;
vspeed += lengthdir_y(move_final, inp_dir)*inp_move;

