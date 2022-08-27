event_inherited();

#region sprite and animation
skeleton_animation_set("walks");
skeleton_skin_set("normal");
headSprite = 1;

animDir = 0;
item_carry = noone;

combat_disable = false;
#endregion

#region ai
owner = noone;
target_obj = noone;
target_x = x;
target_y = y;
target_buffer = 16;
detect_radius_idle = 128;
state = st.carry;
state_timer = -1;

wiggle_timer = 0;

enum st
{
	carry,
	idle,
	move,
	combat,
	go,
	recall,
	king_dash
}
#endregion

#region method functions
function recallFunc() {
	
	animDir = -1;
	state = st.recall;
}
#endregion
