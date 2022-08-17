event_inherited();

//ai
owner = noone;
target_obj = noone;
state = st.carry;

moveSpeed = 3
minionIndex = 0;

enum st
{
	carry,
	idle,
	fetch,
	attack,
	recall
}
