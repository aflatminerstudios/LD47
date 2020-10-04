/// @description Draw text, etc.

//Get old vars
var oldFont = draw_get_font();
var oldColor = draw_get_color();
var oldAlign = draw_get_halign();    
   
//Set vars
draw_set_font(fntGameOver);
draw_set_color(c_white);
draw_set_halign(fa_left);
  
//Shader
shader_set(shd_greyscale);
shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);  
draw_self();

if (style == "Kaiju") {

  totalScore = ((totalSize +  sqrt(bboxSize) + dist) * numAttached * numAttached ) ;

  //Labels
  draw_text(x - 198, y - 68, "Loops attached: "); 
  draw_text(x - 198, y - 30, "Total loop size: ");
  draw_text(x - 198, y + 6, "Overall length: ");
  draw_text(x - 198, y + 46, "Total score: ");
  
  //Scores
  draw_set_halign(fa_right);
  draw_text(x + 155, y - 68, scrAddSeparator(string_format(numAttached, 0, 0), ",", 3));
  draw_text(x + 155, y - 30, scrAddSeparator(string_format(totalSize, 0, 0), ",", 3));
  draw_text(x + 155, y + 6, scrAddSeparator(string_format(dist, 0, 0), ",", 3));
  draw_text(x + 155, y + 46, scrAddSeparator(string_format(totalScore, 0, 0), ",", 3));
  
}

//Reset everything
shader_reset();
draw_set_halign(oldAlign);
draw_set_color(oldColor);
draw_set_font(oldFont);