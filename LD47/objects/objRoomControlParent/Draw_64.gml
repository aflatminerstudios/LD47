/// @description Draw GUI objects

//Draw timer


//If not playing, count down from 3
if (!playing) {
  theTime = max(ceil((preTime + zoomTime - timer)/room_speed), 0);
}

scrDrawTimer(theTime, 400, 32, global.currentTheme.fntColor);

