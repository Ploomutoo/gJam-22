gpu_set_blendmode(bm_subtract);
draw_self();
gpu_set_blendmode(bm_normal);

draw_set_color(c_black);
draw_rectangle(x,y+sprite_height,room_width,oCamera.y+oCamera.camHeight/2,0);
draw_set_color(c_white);
