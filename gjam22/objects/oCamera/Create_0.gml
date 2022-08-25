if(instance_exists(obj_player)) {
	lookAt = obj_player;
	x = lookAt.x
	y = lookAt.y
} else lookAt = noone;

//camera = camera_create();
camWidth = 1280
camHeight = 720;

camera = camera_create();
view_camera[0] = camera;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

camFocus = true;
screenShake = 0;

bgSprite = spr_border;
bgTiles = 1+camHeight/sprite_get_height(bgSprite);
