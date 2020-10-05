/// @description Draw stuff - Destroy is in here
// You can write your code in this editor


var oldFont = draw_get_font();
var oldColor = draw_get_color();
var oldAlign = draw_get_halign();    
        
draw_set_font(fntTicker);
draw_set_color(global.currentTheme.fntColor);
draw_set_halign(fa_center);

if (objShaderControl.fadeAmount != 0) {
  shader_set(shd_greyscale);
  shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);    
}
draw_text(x + textOffset, y, text);

if (objShaderControl.fadeAmount != 0) {
  shader_reset();
}

//This is here to get the proper width
if (x + textOffset + string_width(text) <= textEnd) {
  //show_debug_message("Destroying!");
  instance_destroy();
}

draw_set_halign(oldAlign);
draw_set_color(oldColor);
draw_set_font(oldFont);

