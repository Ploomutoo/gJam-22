music = audio_play_sound(mus5,0,1)

drawX = 1408/2
drawY = 720/2

scribble_font_set_default("fntBase");
typist = scribble_typist();
typist.in(0.8, 0);
typist.sound(talkGremlinNew,0,0.8,1.2)

scribble_anim_pulse(0.1,0.1)

page = [];
pageOn = 0;
page[0] = "[scale,1.5][fa_center][fa_middle][pulse]"
+"You are noble prince [spr_ui_crown,0][c_yellow]Blompo[/c], and you have received a most intriguing offer:[delay,100]\n"
+"A resplendent gala! Hidden deep in the woods[delay,100]\n"
+"[delay,500]\n"
+"An impossible offer to refuse for [c_yellow][wave]Blompo the Decadent[/c][/wave][delay,100]\n"
+"But woe! [shake]The gala begins in a single day?[/shake] It seems you will have no time to pack![delay,100]\n"
+"What's more, you have no time to pre-glut for the extravagant feasting[delay,100]\n"
+"It seems that you will have to do both along your trip[delay,100]\n"
+"[delay,500]\n"
+"Without delay, you gather your [c_yellow]servants[/c] and [wave]ooze[/wave] onto your trusty palanquin[delay,100]\n"
+"[spr_ui_crown,1][c_purple]Nightfall[/c] gnaws at your heels as you rocket out of the palace![delay,100]\n"
+"[shake]There is no time to lose![/shake]";
page[1] = "[scale,1.5][fa_center][fa_middle][pulse]"
+"Travel northwards before [spr_ui_crown,1][c_purple]Nightfall[/c][delay,100]\n"
+"Fend off bandits and gather resources with your [spr_minion,1][c_yellow]Servants[/c][delay,100]\n"
+"But [shake]beware![/shake] Your servants cannot haul your [spr_ui_crown,0][c_yellow]Fat Ass[/c] and do tasks at the same time[delay,100]\n"
+"[delay,500]\n"
+"Send out minions with left click and recall them in a radius with right click[delay,100]\n"
+"Use the scroll wheel to cycle through selected minions"
