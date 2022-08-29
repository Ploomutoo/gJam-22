randomize();

//waves
game_timer = 0;
wave_interval = 800;
wave_num = 0;
wave_offset = 0;

start_diff = 1;
diff_ramp = 0.2;

calc_difficulty = function(_wave)
{
	return diff_ramp*(_wave-1) + start_diff;
}
