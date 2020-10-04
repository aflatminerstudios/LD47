// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@function scrDrawTimer
///@desc Draws the timer, assuming this is during drawGUI
function scrDrawTimer(time, xCoord, yCoord, timerColor){
  var oldFont = draw_get_font();
  var oldColor = draw_get_color();
  var oldAlign = draw_get_halign();    
        
  draw_set_font(fntTimer);
  draw_set_color(timerColor);
  draw_set_halign(fa_center);
  shader_set(shd_greyscale);
  shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);
  draw_sprite(sprHUDTimerCircle, 0, xCoord, yCoord);
  
  draw_text_color(xCoord, yCoord + 8, time, timerColor, timerColor, timerColor, timerColor, 1);
  shader_reset();
  draw_set_halign(oldAlign);
  draw_set_color(oldColor);
  draw_set_font(oldFont);

}

///@function scrScrollText(ticker, text)
///@param ticker Parent ticker object
///@param text What text to scroll
function scrScrollText(ticker, text) {
  //Create text at depth just above ticker
  var instance = instance_create_depth(ticker.x, ticker.y + 37, ticker.depth - 1, objTickerText);
  instance.text = text;
  instance.textOffset = instance.textBegin;
  
  
}

///@function scrToggleGreyscale()
function scrToggleGreyscale() {
  if (objShaderControl.fadeAmount == 0) {
    show_debug_message("Setting fade to 1");
    objShaderControl.fadeAmount = 1;
  } else {
    show_debug_message("Setting fade to 0");
    objShaderControl.fadeAmount = 0;
  }
}