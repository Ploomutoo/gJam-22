if(mute) exit;

//var ev = event_data[?"name"]
//show_debug_message(ev)

var sound = asset_get_index(event_data[?"name"]);
if(sound!=-1) soundRand(sound);
