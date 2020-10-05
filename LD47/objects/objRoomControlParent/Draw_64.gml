/// @description Draw GUI objects

//Draw timer


//If not playing, count down from 3
if (!playing) {
  theTime = max(ceil((preTime + zoomTime - timer)/room_speed), 0);
}

scrDrawTimer(theTime, 400, 32, global.currentTheme.fntColor);

var timeDiff = (preTime + zoomTime) - timer;


//Ready and go display
if (!playing) {


  
  if (timeDiff < 2 * room_speed && instance_number(objReadyGo) == 0) {  
    readyGo = instance_create_layer(400, 300, "UI", objReadyGo);
    readyGo.sprite_index = sprReady;
    readyGo.image_index = 0;
  } else if (timeDiff < room_speed && readyGo != noone) {
    readyGo.sprite_index = sprGo;
    readyGo.image_index = 0;
  }
  
  /*

  if (timeDiff > room_speed && timeDiff < 2 * room_speed) {  
    draw_sprite(sprReady, 0, 400, 300);
  } else if (timeDiff > 0 && timeDiff < room_speed) {
    draw_sprite(sprGo, 0, 400, 300);
  }
*/

}