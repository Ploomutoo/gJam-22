drawX = 1408/2
drawY = 720/2

instance_deactivate_all(true);
layer_set_visible(layer_get_id("Background"),0);

scribble_font_set_default("fntBase");
typist = scribble_typist();
typist.in(0.8, 0);

scribble_anim_pulse(0.1,0.1)
