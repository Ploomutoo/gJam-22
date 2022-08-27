var lookX;
var lookY;
var camRad = camWidth/2;

if(lookAt!=noone) {
	lookX = lookAt.x
	lookY = lookAt.y+yOffset
	if(camFocus){
		if(mouse_x>0) {
			
			mouseLastX = mouse_x;
			mouseLastY = mouse_y;
		}
		
		lookX += (mouseLastX-lookX)/8;
		lookY += (mouseLastY-lookY)/8;
	}
} else {
	lookX = room_width/2
	lookY = room_height/2
}

x = clamp(lookX,camRad,room_width-camRad)
y = clamp(lookY,0,room_height+camHeight/2)


var finX = round(x)
var finY = round(y)

if(screenShake != 0) {
	
	screenShake = -screenShake * 0.8
	if(abs(screenShake)<0.5) screenShake = 0;
	
	finY += screenShake/5
}

var vm = matrix_build_lookat(finX,finY,-10,finX,finY,0,0,1,0);
camera_set_view_mat(camera,vm)

var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);
camera_set_proj_mat(camera,pm);