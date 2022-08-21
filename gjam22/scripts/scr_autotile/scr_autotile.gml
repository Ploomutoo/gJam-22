// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function autotile_lookup_init()
{
	var ds = ds_map_create();
	
	ds_map_add(ds, 2, 1);
	ds_map_add(ds, 8, 2);
	ds_map_add(ds, 10, 3);
	ds_map_add(ds, 11, 4);
	ds_map_add(ds, 16, 5);
	ds_map_add(ds, 18, 6);
	ds_map_add(ds, 22, 7);
	ds_map_add(ds, 24, 8);
	ds_map_add(ds, 26, 9);
	ds_map_add(ds, 27, 10);
	ds_map_add(ds, 30, 11);
	ds_map_add(ds, 31, 12);
	ds_map_add(ds, 64, 13);
	ds_map_add(ds, 66, 14);
	ds_map_add(ds, 72, 15);
	ds_map_add(ds, 74, 16);
	ds_map_add(ds, 75, 17);
	ds_map_add(ds, 80, 18);
	ds_map_add(ds, 82, 19);
	ds_map_add(ds, 86, 20);
	ds_map_add(ds, 88, 21);
	ds_map_add(ds, 90, 22);
	ds_map_add(ds, 91, 23);
	ds_map_add(ds, 94, 24);
	ds_map_add(ds, 95, 25);
	ds_map_add(ds, 104, 26);
	ds_map_add(ds, 106, 27);
	ds_map_add(ds, 107, 28);
	ds_map_add(ds, 120, 29);
	ds_map_add(ds, 122, 30);
	ds_map_add(ds, 123, 31);
	ds_map_add(ds, 126, 32);
	ds_map_add(ds, 127, 33);
	ds_map_add(ds, 208, 34);
	ds_map_add(ds, 210, 35);
	ds_map_add(ds, 214, 36);
	ds_map_add(ds, 216, 37);
	ds_map_add(ds, 218, 38);
	ds_map_add(ds, 219, 39);
	ds_map_add(ds, 222, 40);
	ds_map_add(ds, 223, 41);
	ds_map_add(ds, 248, 42);
	ds_map_add(ds, 250, 43);
	ds_map_add(ds, 251, 44);
	ds_map_add(ds, 254, 45);
	ds_map_add(ds, 255, 46);
	ds_map_add(ds, 0, 47);
	
	return ds;
}

function autotile_region(grid, tilemap, lookup, x1, y1, x2, y2, join_all)
{
	var tile_map_w = tilemap_get_width(tilemap);
	var tile_map_h = tilemap_get_height(tilemap);
	for(var i = y1; i <= y2; i++)
	{
		for(var j = x1; j <= x2; j++)
		{
			//if in bounds
			if(i >= 0 && i < tile_map_h && j >= 0 && j < tile_map_w)
			{
				//if value is nothing, set tile to nothing
				if(grid[# j, i] = 0)
				{
					tilemap_set(tilemap, 0, j, i);
				}
				else
				{
					//checking nearby tiles
					var reps = 0;
					var val = 0;
					for(var k = -1; k <= 1; k++)
					{
						for(var l = -1; l <= 1; l++)
						{
							//skip the center
							if(!(l = 0 && k = 0))
							{
								//if in bounds
								if(i+k >= 0 && i+k < tile_map_h && j+l >= 0 && j+l < tile_map_w)
								{
									//if a valid value
									if(grid[# j+l, i+k] != 0 && (join_all || grid[# j+l, i+k] = grid[# j, i]))
									{
										//if not an orphaned corner
										/*if(join_all)
										{
											if(!((l != 0 || k != 0) && (grid[# j+l, i] = 0 || grid[# j, i+k] = 0)))
											{
												val = val | (1 << reps);
											}
										}
										else
										{
											if(!((l != 0 || k != 0) && (grid[# j+l, i] != grid[# j+l, i+k] || grid[# j, i+k] != grid[# j+l, i+k])))
											{
												val = val | (1 << reps);
											}
										}*/
										if(join_all && ((l = 0 || k = 0) || (grid[# j+l, i] != 0 && grid[# j, i+k] != 0)))
										{
											val = val | (1 << reps);
										}
										else if((l = 0 || k = 0) || (grid[# j+l, i] = grid[# j+l, i+k] && grid[# j, i+k] = grid[# j+l, i+k]))
										{
											val = val | (1 << reps);
										}
									}
								}
								reps++;
							}
						}
					}
					//show_debug_message(string(val));
					//show_debug_message(string(obj_controller.tile_lookup[? val]));
					tilemap_set(tilemap, lookup[? val]+1+(48*(grid[# j, i]-1)), j, i);
				}
			}
		}
	}
}