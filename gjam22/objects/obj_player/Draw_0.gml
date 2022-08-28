if(iFrames>10 && iFrames%5>3) {
	
	gpu_set_fog(1,c_white,1,1);
	draw_self();
	gpu_set_fog(0,0,0,0);
	
} else draw_self();


