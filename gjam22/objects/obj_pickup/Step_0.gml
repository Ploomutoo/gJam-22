if(speed>0) {
	
	var potx = x+hspeed;
	var poty = y+vspeed;

	if(potx>room_width || potx<0 || poty<obj_ui.uiBottom || poty>room_height)
	{
	
		direction+=180;
		speed = max(speed,2);
	}
}

event_inherited();
