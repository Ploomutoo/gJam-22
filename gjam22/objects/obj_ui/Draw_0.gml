draw_set_color(c_black); draw_set_alpha(0.3);
draw_rectangle(-200,0,uiBottom-200,room_height,0);
draw_set_color(c_white); draw_set_alpha(1);

if(drawCirc>0) {
	drawCirc--;
	draw_circle(dcx,dcy,dcr*drawCirc/60,1);
}
