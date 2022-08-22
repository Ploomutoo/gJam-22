function minCycle(add){
	
	var minStart = minionOn;
	var minCount = array_length(minion_arr)-1;
	
	minionOn+=add;
	
	if(minionOn<0) minionOn = minCount;
	if(minionOn>=minCount) minionOn = 0;
	
	while(minion_arr[minionOn].state!=st.carry){
		minionOn--;
		if(minionOn<0) minionOn = array_length(minion_arr)-1;
		
		if(minionOn = minStart) break;
	}
}
