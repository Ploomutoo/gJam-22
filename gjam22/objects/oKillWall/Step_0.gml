y-=0.5;
x=oCamera.x-oCamera.camWidth/2;

if(y<room_height) progress = clamp(y/room_height,0,1)
if(target.y>y+sprite_height/2) with(target) event_user(0);
