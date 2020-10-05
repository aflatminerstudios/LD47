/// @description Draw stuff - Destroy is in here
// You can write your code in this editor


var oldFont = draw_get_font();
var oldColor = draw_get_color();
var oldAlign = draw_get_halign();    
        
draw_set_font(fntTicker);
draw_set_color(global.currentTheme.tickerColor);
draw_set_halign(fa_center);

if (objShaderControl.fadeAmount != 0) {
  shader_set(shd_greyscale);
  shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);    
}
draw_text(textOffset, y, text);

if (objShaderControl.fadeAmount != 0) {
  shader_reset();
}


var location = textOffset + string_width(text);

//This is here to get the proper width
if (location <= textEnd) {
  //show_debug_message("Destroying!");
  if (instance_number(objTickerText) <= 1) {
    show_message("Setting to true");
    objRoomControlParent.canSpawnText = true;     
  }
  instance_destroy();
} else if (location <= 2 * camera_get_view_width(view_camera[0]) / 3) {
  if (instance_number(objTickerText) <= 1 && objRoomControlParent.alarm[5] <= 0) {
    
    objRoomControlParent.alarm[5] = irandom_range(1, room_speed/2);
  }
}

draw_set_halign(oldAlign);
draw_set_color(oldColor);
draw_set_font(oldFont);

