// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@functions scrDrawTimer
///@desc Draws the timer, assuming this is during drawGUI
function scrDrawTimer(time, xCoord, yCoord, timerColor){
  with (controller) {
    var oldFont = draw_get_font();
    var oldColor = draw_set_color();
    var oldAlign = draw_get_halign();    
        
    draw_set_font(fntTimer);
    draw_set_color(timerColor);
    draw_set_halign(fa_center);
    
    draw_text_color(xCoord, yCoord, time, timerColor, timerColor, timerColor, timerColor, 1);

    draw_set_halign(oldAlign);
    draw_set_color(oldColor);
    draw_set_font(oldFont);
  }
}