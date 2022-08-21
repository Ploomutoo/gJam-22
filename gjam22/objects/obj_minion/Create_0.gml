event_inherited();

//ai
owner = noone;
target_obj = noone;
target_x = x;
target_y = y;
target_buffer = 5;
state = st.carry;

wiggle_amt = 45;
wiggle_speed = 0.05;
wiggle_timer = 0;

skeleton_animation_set("walks");
skeleton_skin_set("normal");

//stats


enum st
{
	carry,
	idle,
	move,
	fetch,
	attack,
	recall
}
