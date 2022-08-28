// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pushAway(object) {
	
	var dir = point_direction(x,y,object.x,object.y);
	with(object) motion_add(dir,1)
}

function tile_place_meeting(object, layer, xx, yy)
{
	//finding tilemap
	var tm = layer_tilemap_get_id(layer);
	
	xx = round(xx);
	yy = round(yy);
	
	var obj_x = round(object.x);
	var obj_y = round(object.y);
	
	//getting corner cells
	var _x1 = max(0, tilemap_get_cell_x_at_pixel(tm, object.bbox_left + (xx - obj_x), obj_y)),
	var _y1 = max(0, tilemap_get_cell_y_at_pixel(tm, obj_x, object.bbox_top + (yy - obj_y))),
	var _x2 = max(0, tilemap_get_cell_x_at_pixel(tm, object.bbox_right + (xx - obj_x), obj_y)),
	var _y2 = max(0, tilemap_get_cell_y_at_pixel(tm, obj_x, object.bbox_bottom + (yy - obj_y)));
	
	//checking rectangular area of tiles
	if(_x1 >= 0 && _y1 >= 0 && _x2 >= 0 && _y2 >= 0)
	{
		for(var check_x = _x1; check_x <= _x2; check_x++)
		{
			for(var check_y = _y1; check_y <= _y2; check_y++)
			{
				if(tile_get_index(tilemap_get(tm, check_x, check_y)))
				{
					return true;
				}
			}
		}
	}
	else
	{
		return true;
	}

	return false;
}

function tile_collision(tile_layer, bounce = 0)
{
	//exit if layer does not exist
	if(!layer_exists(tile_layer))
	{
		exit;
	}
	
	//var setup
	var planned_x = x;
	var planned_y = y;
	var planned_hspeed = hspeed;
	var planned_vspeed = vspeed;
	
	//perform checks
	var hcheck = hspeed;
	var vcheck = vspeed;
	var h_collide = tile_place_meeting(id, tile_layer, x+hcheck, y);
	var v_collide = tile_place_meeting(id, tile_layer, x, y+vcheck);
	var d_collide = tile_place_meeting(id, tile_layer, x+hcheck, y+vcheck);
	
	//diagonal
	if(d_collide && !(h_collide || v_collide))
	{
		//randomize collision type
		if(irandom(1) = 1)
		{
			h_collide = true;
		}
		else
		{
			v_collide = true;
		}
	}
	
	//horizontal
	if(h_collide)
	{
		if(sign(hspeed) = 1)
		{
			planned_x = round(bbox_right/TILE_W)*TILE_W - (bbox_right-round(x))-1;
		}
		else if(sign(hspeed) = -1)
		{
			planned_x = round(bbox_left/TILE_W)*TILE_W - (bbox_left-round(x));
		}
		planned_hspeed = -planned_hspeed*bounce;
	}
	
	//vertical
	if(v_collide)
	{
		if(sign(vspeed) = 1)
		{
			planned_y = round(bbox_bottom/TILE_W)*TILE_W - (bbox_bottom-round(y))-1;
		}
		else if(sign(vspeed) = -1)
		{
			planned_y = round(bbox_top/TILE_W)*TILE_W - (bbox_top-round(y));
		}
		planned_vspeed = -planned_vspeed*bounce;
	}
	
	//setting location and speed
	x = planned_x;
	y = planned_y;
	hspeed = planned_hspeed;
	vspeed = planned_vspeed;
}

function check_los(tile_layer, x1, y1, x2, y2)
{
	var tm = layer_tilemap_get_id(tile_layer);
	var dist = point_distance(x1, y1, x2, y2);
	var dir = point_direction(x1, y1, x2, y2);
	var inc = 1;
	for(var i = 0; i <= dist; i+=inc)
	{
		var check_x = x1+lengthdir_x(i, dir);
		var check_y =  y1+lengthdir_y(i, dir);
		if(tilemap_get_at_pixel(tm, check_x, check_y) != 0)
		{
			return false;
		}
	}
	return true;
}