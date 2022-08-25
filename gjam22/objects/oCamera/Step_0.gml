var lookX;
var lookY;

if(lookAt!=noone) {
	lookX = lookAt.x
	lookY = lookAt.y+yOffset
	if(camFocus){
		lookX += (mouse_x-lookX)/8;
		lookY += (mouse_y-lookY)/8;
	}
} else {
	lookX = room_width/2
	lookY = room_height/2
}

x = clamp(lookX,camWidth/2,room_width-camWidth/2)
y += (lookY-y)/6


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