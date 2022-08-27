bgm = audio_play_sound(musShop,0,1);
money = instance_find(obj_player,0).coins
instance_deactivate_all(true);

drawX = 1408/2
drawY = 720/2

scribble_font_set_default("fntBase");
typist = scribble_typist();
typist.in(0.8, 0);
typist.sound(talkGremlinNew,0,0.8,1.2)

scribble_anim_pulse(0.1,0.1)
