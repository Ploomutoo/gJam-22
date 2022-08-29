if(obj_player.y <= room_height-wave_num*wave_interval)
{
	soundRand(sndBiterHerald);
	wave_num++;
	
	//Generate list of units
	var units = [];
	var spawnCredits = floor(calc_difficulty(wave_num+wave_offset));
	while(spawnCredits>0) {
		
		var i = 0;
		var spawn_obj = irandom(epDepth);
		while(spawn_obj>enemyPool[i,1]) {
				
			spawn_obj-=enemyPool[i,1]
			i++;
		}
		
		//De Increment List if unit cost too high
		while(spawnCredits-enemyPool[i,2]<0) {
			//show_debug_message("deinc")
			i=irandom(i-1)
		}
		spawn_obj = enemyPool[i,0];	
		array_push(units,spawn_obj);
		spawnCredits-=enemyPool[i,2];
	}
	
	var count = array_length(units);
	//Place in formation
	//var wave_formation = irandom(2);
	var wave_formation = 2
	switch wave_formation
	{
		//surround
		case 0:
		var spawn_dist = max(oCamera.camWidth, oCamera.camHeight)/2 + 32;
		for(var i = 0; i < count; i++)
		{
			var spawn_dir = 360/count*i;
			var spawn_x = lengthdir_x(spawn_dist, spawn_dir) + oCamera.x;
			var spawn_y = lengthdir_y(spawn_dist, spawn_dir) + oCamera.y;
			
			instance_create_layer(spawn_x,spawn_y,layer,units[i])
		}
		break;
		
		//rush
		case 1:
		var spawn_dist = max(oCamera.camWidth, oCamera.camHeight)/2 + 64;
		var spawn_dir = random(360);
		for(var i = 0; i < count; i++)
		{
			var spawn_x = lengthdir_x(spawn_dist, spawn_dir) + oCamera.x + random_range(-32, 32);
			var spawn_y = lengthdir_y(spawn_dist, spawn_dir) + oCamera.y + random_range(-32, 32);
			
			instance_create_layer(spawn_x,spawn_y,layer,units[i])
		}
		break;
		
		//pincer
		case 2:
		var spawn_dist = max(oCamera.camWidth, oCamera.camHeight)/2 + 64;
		//var spawn_dir = random(360);
		for(var i = 0; i < count; i++)
		{	
			if(i%2 = 1) spawn_dir = random_range(30,60);
			else spawn_dir = random_range(120,150);
			
			var spawn_x = lengthdir_x(spawn_dist, spawn_dir+i%2*180) + oCamera.x + random_range(-32, 32);
			var spawn_y = lengthdir_y(spawn_dist, spawn_dir+i%2*180) + oCamera.y + random_range(-32, 32);
			
			instance_create_layer(spawn_x,spawn_y,layer,units[i])
		}
		break;
	}
	//show_debug_message("enemy set to "+string(units[i].x)+", "+string(units[i].y))
}

//incrementing timers
game_timer++;
