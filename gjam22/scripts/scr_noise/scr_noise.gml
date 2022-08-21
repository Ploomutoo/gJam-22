//Squirrel Eiserloh, 'Math for Game Programmers: Noise-Based RNG', GDC 2017
function squirrel3(position, seed)
{
	var prime_1 = 0xd2a80a3f;	// 11010010101010000000101000111111
	var prime_2 = 0xa884f197;	// 10101000100001001111000110010111
	var prime_3 = 0x6C736F4B; // 01101100011100110110111101001011
	var prime_4 = 0xB79F3ABB;	// 10110111100111110011101010111011
	var prime_5 = 0x1b56c4f5;	// 00011011010101101100010011110101
	
	var cap = 2147483647;
	
	var output = position;
	output *= prime_1;
	output += seed;
	output = output % cap; //enforce cap
	output ^= (output >> 9);
	output += prime_2;
	output = output % cap; //enforce cap
	output ^= (output >> 11);
	output *= prime_3;
	output = output % cap; //enforce cap
	output ^= (output >> 13);
	output += prime_4;
	output = output % cap; //enforce cap
	output ^= (output >> 15);
	output *= prime_5;
	output = output % cap; //enforce cap
	output ^= (output >> 17);
	return output;
}

function seeded_rand(v_min, v_max, position, seed)
{
	var start = 100*min(v_min, v_max);
	var finish = 100*max(v_min, v_max);
	var range = finish - start;
	var result = squirrel3(position, seed) % (range+1) + start;
	return result/100;
}

function smooth_noise_2d(v_min, v_max, xpos, ypos, octave_size, seed)
{
	var prime_4 = 0xB79F3ABB;
	
	//clockwise
	var corner_1 = seeded_rand(v_min, v_max, floor(xpos/octave_size) + (floor(ypos/octave_size) * prime_4), seed);
	var corner_2 = seeded_rand(v_min, v_max, ceil(xpos/octave_size) + (floor(ypos/octave_size) * prime_4), seed);
	var corner_3 = seeded_rand(v_min, v_max, ceil(xpos/octave_size) + (ceil(ypos/octave_size) * prime_4), seed);
	var corner_4 = seeded_rand(v_min, v_max, floor(xpos/octave_size) + (ceil(ypos/octave_size) * prime_4), seed);
	
	//lerp step 1
	var lerp1a = lerp(corner_1, corner_2, frac(xpos/octave_size));
	var lerp1b = lerp(corner_4, corner_3, frac(xpos/octave_size));
	//lerp step 2
	var lerp2a = lerp(lerp1a, lerp1b, frac(ypos/octave_size));
	
	return lerp2a;
}

function smooth_noise_3d(v_min, v_max, xpos, ypos, zpos, octave_size, seed)
{
	var prime_4 = 0xB79F3ABB;
	var prime_5 = 0x1b56c4f5;
	
	//bottom, clockwise
	var corner_1 = seeded_rand(v_min, v_max, floor(xpos/octave_size) + (floor(ypos/octave_size) * prime_4) + (floor(zpos/octave_size) * prime_5), seed);
	var corner_2 = seeded_rand(v_min, v_max, ceil(xpos/octave_size) + (floor(ypos/octave_size) * prime_4) + (floor(zpos/octave_size) * prime_5), seed);
	var corner_3 = seeded_rand(v_min, v_max, ceil(xpos/octave_size) + (ceil(ypos/octave_size) * prime_4) + (floor(zpos/octave_size) * prime_5), seed);
	var corner_4 = seeded_rand(v_min, v_max, floor(xpos/octave_size) + (ceil(ypos/octave_size) * prime_4) + (floor(zpos/octave_size) * prime_5), seed);
	//top, clockwise
	var corner_5 = seeded_rand(v_min, v_max, floor(xpos/octave_size) + (floor(ypos/octave_size) * prime_4) + (ceil(zpos/octave_size) * prime_5), seed);
	var corner_6 = seeded_rand(v_min, v_max, ceil(xpos/octave_size) + (floor(ypos/octave_size) * prime_4) + (ceil(zpos/octave_size) * prime_5), seed);
	var corner_7 = seeded_rand(v_min, v_max, ceil(xpos/octave_size) + (ceil(ypos/octave_size) * prime_4) + (ceil(zpos/octave_size) * prime_5), seed);
	var corner_8 = seeded_rand(v_min, v_max, floor(xpos/octave_size) + (ceil(ypos/octave_size) * prime_4) + (ceil(zpos/octave_size) * prime_5), seed);
	
	//lerp step 1
	var lerp1a = lerp(corner_1, corner_2, frac(xpos/octave_size));
	var lerp1b = lerp(corner_4, corner_3, frac(xpos/octave_size));
	var lerp1c = lerp(corner_5, corner_6, frac(xpos/octave_size));
	var lerp1d = lerp(corner_8, corner_7, frac(xpos/octave_size));
	//lerp step 2
	var lerp2a = lerp(lerp1a, lerp1b, frac(ypos/octave_size));
	var lerp2b = lerp(lerp1c, lerp1d, frac(ypos/octave_size));
	//lerp step 3
	var lerp3a = lerp(lerp2a, lerp2b, frac(zpos/octave_size));
	
	return lerp3a;
}