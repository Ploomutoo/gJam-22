event_inherited();

//inputs
inp_move = false;
inp_dir = 0;

//movement
dspeed = 0;
grav = 0.25;

drag = 0.25;
air_drag = 0.1;

//stats
max_hp = 5;
hp = max_hp;
move_force = 1;
air_move_force = move_force * (air_drag / drag);