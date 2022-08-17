event_inherited();

//ai
owner = noone;
target_obj = noone;
target_x = 0;
target_y = 0;
state = st.carry;

enum st
{
	carry,
	idle,
	fetch,
	attack,
	recall
}
