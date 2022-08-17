var target = instance_nearest(mouse_x,mouse_y,obj_minion);
if(target = noone || point_distance(mouse_x,mouse_y,target.x,target.y) > 128) exit;

if(target.state != st.carry) target.state = st.recall;
