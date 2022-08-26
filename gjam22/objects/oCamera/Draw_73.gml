var iy = y-camHeight/2;
var iy2 = iy-(y*1.15)%128
iy -=(y*1.1)%128

var ix = 0;


for(var i = 0; i<bgTiles; i++) {
	
	draw_sprite(bgSprite,0,ix,iy)
	draw_sprite_ext(bgSprite,0,room_width+ix,iy,-1,1,0,c_white,1);
	iy+=sprite_get_height(bgSprite);
}
ix-=48;

for(i = 0; i<bgTiles; i++) {
	
	draw_sprite(bgSprite,1,ix,iy2)
	draw_sprite_ext(bgSprite,1,room_width-ix,iy2,-1,1,0,c_white,1);
	iy2+=sprite_get_height(bgSprite);
}

//if(y>room_height-camHeight)draw_sprite(spr_arrow,0,x,y+camHeight/2-16);
