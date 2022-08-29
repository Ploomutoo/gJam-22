event_inherited();
y = room_height;
x = room_width/2;

minion_radius = 64;

minion_arr = [];
busy_arr = [];
minion_selected = 0;

old_z = z;
music = 0;

skeleton_animation_set("default");
skeleton_skin_set("weight-1");
skeleton_animation_mix("default","move",0.05);
skeleton_animation_mix("move","default",0.05);
//other animations are move and command

function walkSet() {
	
	image_speed = 1;
	if(speed>0) {
		skelSet("move")
		image_speed=1+speed/3
		
	} else skelSet("default")
}

//resources
coins = 0;
food = 0;
level = 1;
win = false;

function foodCalc() 
{	
	if(food>5*level) {
		
		food = 0;
		level++;
		minion_slots++;
		soundRand(sndHealth);
		if(level>4 && skeleton_skin_get()="weight-1") {
			
			textPopup(x,y-128,"LARD UP!");
			skeleton_skin_set("weight-2");
			
		} else textPopup(x,y-128,"LEVEL UP!")
	}
	/*var bonemap = ds_map_create();
	skeleton_bone_data_get("scaleBone", bonemap);
	show_debug_message("scale bone was "+string(bonemap[?"xscale"]))
	ds_map_replace(bonemap, "xscale", 1+food);
	show_debug_message("scale bone is "+string(bonemap[?"xscale"]))
	skeleton_bone_data_set("scaleBone", bonemap);
	ds_map_destroy(bonemap);*/
}

//counters and tracking
bark = 0
progress = 0;
iFrames = 0;

//spawning minions
function addMinion(object) {
	
	var inst = createAt(object);
	inst.owner = id;
	array_push(minion_arr, inst);
	
	return(inst);
}

ini_open("unitMemory");
var memUnit = ini_read_real("unit","unit",obj_minion_normal)
ini_close();

repeat(minion_slots)
{	
	if(memUnit!=-1) {
		addMinion(memUnit);
		memUnit = -1;
	} else addMinion(obj_minion_normal);
	
}

//sorting minion array
function minion_sort (_elm1, _elm2)
{
	var sort_type = _elm1.object_index-_elm2.object_index;
	var sort_deployed = (_elm1.state != st.carry) -  (_elm2.state != st.carry);
	var sort_id = _elm1.id-_elm2.id;
    return sort_type*100 + sort_deployed*10 + sort_id;
}
array_sort(minion_arr,minion_sort);

with(instance_nearest(x,y,oRock)) instance_destroy();
