//game_restart();
ini_open("unitMemory");
if(ini_key_exists("unit","unit")) {
	soundRand(sndDelete);
	ini_key_delete("unit","unit");
}
ini_close();
