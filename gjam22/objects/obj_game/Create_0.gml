randomize();

//waves
game_timer = 0;
wave_interval = 800;
wave_num = 0;
wave_offset = 0;

start_diff = 2;
diff_ramp = 0.2;

calc_difficulty = function(_wave)
{
	return diff_ramp*(_wave-1) + start_diff;
}
//spawnCredits = 0;

//0 is object ID
//1 is weighting
//2 is cost
enemyPool = [
[obj_enemy_biter,10,1],
[obj_enemy_barger,3,2]
];
	
epDepth = 0;
for(var i = array_length(enemyPool)-1; i>=0; i--) {	
	epDepth+=enemyPool[i,1];
}
show_debug_message("pool "+string(epDepth))

function poolDraw() {
	
	var j = 0;
	var spawn_obj = irandom(epDepth);
	while(spawn_obj>enemyPool[j,1]) {
				
		spawn_obj-=enemyPool[j,1]
		j++;
	}
	spawn_obj = enemyPool[j,0];			
	instance_create_layer(spawn_x, spawn_y, layer, spawn_obj);
	i-=enemyPool[j,2];
}
