/// @description Init variables, create buttons
// You can write your code in this editor


instance_create_depth(x + 90, y, depth - 1, objBtnReplay);
instance_create_depth(x + 200, y, depth - 1, objBtnMode);
instance_create_depth(x + 310, y, depth - 1, objBtnTheme);



alarm[0] = 0.75 * room_speed;

ready = false;


//Which game mode this came from
style = "Kaiju"

//Kaiju mode variables
numAttached = 0;
totalSize = 0;
dist = 0;
bboxSize = 0;
timer = 0;
maxTimer = 0;

//BulletBoss variables
ships = 0;


won = true;