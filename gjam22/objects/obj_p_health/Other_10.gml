soundRand(sndHealth);
with(obj_player) {
	
	textPopup(x,y-64,"<3")
	
	hp++;
	if(hp>max_hp) hp = max_hp;
}
