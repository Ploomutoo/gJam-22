event_inherited();

//ai
owner = noone;
target_obj = noone;
target_x = x;
target_y = y;
target_buffer = 16;
state = st.carry;

wiggle_amt = 45;
wiggle_speed = 0.05;
wiggle_timer = 0;

//Cosmetics
skeleton_animation_set("walks");
skeleton_skin_set("normal");
headSprite = 1;

animDir = 0;
item_carry = noone;

//stats
combat_speed = 1;
combat_damage = 1;
combat_disable = false;

enum st
{
	carry,
	idle,
	move,
	combat,
	go,
	recall
}

function recallFunc() {
	
	animDir = -1;
	state = st.recall;
	/*with(obj_player) {
		
		array_delete(busy_arr,array_find_index(busy_arr,other.id),1);
		array_push(minion_arr,other.id);
		array_sort(minion_arr,minion_sort);
	}*/
}
