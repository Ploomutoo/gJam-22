event_inherited();

if(image_index>=0) exit;

valMoney = 0;
valFood = 0;
valHealth = 0;

var roll = irandom(image_number-1)
image_index = roll;

if(roll<3) valMoney = 1;
else if(roll<6) valFood = 1;
else valHealth = 1;
