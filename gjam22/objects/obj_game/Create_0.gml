//waves
game_timer = 0;
wave_interval = 800;
wave_num = 0;

start_diff = 2;
diff_ramp = 1;

calc_difficulty = function(_wave)
{
	return diff_ramp*(_wave-1) + start_diff;
}