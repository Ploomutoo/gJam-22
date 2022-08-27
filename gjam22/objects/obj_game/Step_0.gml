if(wave_timer <= 0)
{
	wave_num++;
	wave_timer = wave_dur;
	var wave_formation = irandom(2);
	switch wave_formation
	{
		//surround
		case 0:
		var count = calc_difficulty(wave_num);
		for(var i = 0; i < count; i++)
		{
			var spawn_dist = max(oCamera.camWidth, oCamera.camHeight) + 32;
			var spawn_dir = 360/count*i;
			var spawn_x = lengthdir_x(spawn_dist, spawn_dir) + oCamera.x;
			var spawn_y = lengthdir_y(spawn_dist, spawn_dir) + oCamera.y;
			instance_create_layer(spawn_x, spawn_y, layer, obj_enemy_slime);
		}
		break;
		
		//rush
		case 1:
		var count = calc_difficulty(wave_num);
		var spawn_dist = max(oCamera.camWidth, oCamera.camHeight)/2 + 64;
		var spawn_dir = random(360);
		for(var i = 0; i < count; i++)
		{
			var spawn_x = lengthdir_x(spawn_dist, spawn_dir) + oCamera.x + random_range(-32, 32);
			var spawn_y = lengthdir_y(spawn_dist, spawn_dir) + oCamera.y + random_range(-32, 32);
			instance_create_layer(spawn_x, spawn_y, layer, obj_enemy_slime);
		}
		break;
		
		//pincer
		case 2:
		var count = calc_difficulty(wave_num);
		var spawn_dist = max(oCamera.camWidth, oCamera.camHeight) + 64;
		var spawn_dir = random(360);
		for(var i = 0; i < count; i++)
		{
			var spawn_x = lengthdir_x(spawn_dist, spawn_dir+i%2*180) + oCamera.x + random_range(-32, 32);
			var spawn_y = lengthdir_y(spawn_dist, spawn_dir+i%2*180) + oCamera.y + random_range(-32, 32);
			instance_create_layer(spawn_x, spawn_y, layer, obj_enemy_slime);
		}
		break;
	}
}

//incrementing timers
game_timer++;
wave_timer--;
