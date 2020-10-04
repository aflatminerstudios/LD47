/// @description Draw GUI objects

//Draw timer
var theTime = ceil((maxTimer - timer)/room_speed);

//If not playing, count down from 3
if (!playing) {
  theTime = max(ceil((preTime - timer)/room_speed)+1, 0);
}

scrDrawTimer(theTime, 400, 35, c_red);

