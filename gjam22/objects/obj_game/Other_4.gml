/// @description Insert description here
if(room = rm_game)
{
	wave_offset += wave_num;
	wave_num = 0;
	//room generation
	room_seed = random(99999999);
	var cell = 128;
	var offset = 32;
	for(var yy = 0; yy < room_height; yy+=cell)
	{
		for(var xx = 0; xx < room_width; xx+=cell)
		{
			var val = smooth_noise_2d(0, 0.5, xx/cell, yy/cell, 2, room_seed) + smooth_noise_2d(0, 0.5, xx/cell, yy/cell, 0.5, room_seed+1);
			if(val > 0.7)
			{
				var x_offset = smooth_noise_2d(-offset, offset, xx/cell, yy/cell, 0.5, room_seed+2);
				var y_offset = smooth_noise_2d(-offset, offset, xx/cell, yy/cell, 0.5, room_seed+3);
				var type = seeded_rand(0, 1, real(string(xx)+string(yy)), room_seed+4);
				var obj = oRock;
				if(type >= 0.95)
				{
					obj = oGoldRock;
				}
				else
				if(type >= 0.90)
				{
					obj = oBumpkinBush;
				}
				instance_create_layer(xx+x_offset, yy+y_offset, layer, obj);
			}
		}	
	}
}
