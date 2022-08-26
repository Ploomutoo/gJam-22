if(typist.get_state()!=1) {
		
	//show_debug_message("on "+string(typist.get_position())+" of "+string(string_length(page[pageOn])-1))
	typist.skip();
	soundRand(sndUiClick);
	
	exit;
}

if(pageOn<array_length(page)-1) {
	
	pageOn++;
	exit;
}

instance_activate_all();
layer_set_visible(layer_get_id("Background"),1);
instance_destroy();
