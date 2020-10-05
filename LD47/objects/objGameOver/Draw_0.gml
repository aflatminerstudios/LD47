/// @description Draw text, etc.

//Get old vars
var oldFont = draw_get_font();
var oldColor = draw_get_color();
var oldAlign = draw_get_halign();    
   
//Set vars
draw_set_font(fntGameOver);
draw_set_color(global.currentTheme.fntColor);
draw_set_halign(fa_left);
  
//Shader
if (objShaderControl.fadeAmount != 0) {
  shader_set(shd_greyscale);
  shader_set_uniform_f(objShaderControl.fade, objShaderControl.fadeAmount);  
}
draw_self();

if (style == "Kaiju") {

  totalScore = ((totalSize +  sqrt(bboxSize) + dist) * numAttached * numAttached ) ;

  //Labels
  draw_text(x - 198, y - 68, "Loops attached: "); 
  draw_text(x - 198, y - 30, "Total loop size: ");
  draw_text(x - 198, y + 6, "Length: ");
  draw_text(x - 198, y + 46, "Total score: ");
  
  //Scores
  draw_set_halign(fa_right);
  draw_text(x + 155, y - 68, scrAddSeparator(string_format(numAttached, 0, 0), ",", 3));
  draw_text(x + 155, y - 30, scrAddSeparator(string_format(totalSize, 0, 0), ",", 3));
  draw_text(x + 155, y + 6, scrAddSeparator(string_format(dist, 0, 0), ",", 3));
  draw_text(x + 155, y + 46, scrAddSeparator(string_format(totalScore, 0, 0), ",", 3));
  
}

if (style == "Obstacle") {
  
  if (won) {
    totalScore = (maxTimer - timer)/room_speed * (numAttached) * (dist) * sqrt(totalSize);
  } else {
    totalScore = sqrt(numAttached * dist * totalSize);
  }
  
  if (sprite_index == sprGOFail) {
    draw_set_color(c_black);
  }

  
  //Labels
  draw_text(x - 198, y - 68, "Time: "); 
  draw_text(x - 198, y - 30, "Loops attached: ");
  draw_text(x - 198, y + 6, "Length: ");
  draw_text(x - 198, y + 46, "Total score: ");
  
  //Scores
  draw_set_halign(fa_right);
  draw_text(x + 155, y - 68, string_format(timer / room_speed, 0, 2) + " s");
  draw_text(x + 155, y - 30, scrAddSeparator(string_format(numAttached, 0, 0), ",", 3));
  draw_text(x + 155, y + 6, scrAddSeparator(string_format(dist, 0, 0), ",", 3));
  draw_text(x + 155, y + 46, scrAddSeparator(string_format(totalScore, 0, 0), ",", 3));
  }

//Reset everything
if (objShaderControl.fadeAmount != 0) {
  shader_reset();
}

if (style == "BulletBoss") {

	var loops = numAttached;
	var time = dist; // Using this for time survived
	var ships = totalSize; // Using this for ships destroyed
  //totalScore = ((totalSize + sqrt(bboxSize) + dist) * numAttached * numAttached);
	totalScore = time * 1 + ships * 1 + loops*5;

  //Labels
  draw_text(x - 198, y - 68, "Time survived: "); 
  draw_text(x - 198, y - 30, "Ships destroyed: ");
  draw_text(x - 198, y + 6,  "Loops attached: ");
  draw_text(x - 198, y + 46, "Total score: ");
  
  //Scores
  draw_set_halign(fa_right);
	var seconds = time/60;
	var timeString = string_format(seconds, 0, 1) + "\""
	draw_text(x + 155, y - 68, timeString);
  draw_text(x + 155, y - 30, scrAddSeparator(string_format(ships, 0, 0), ",", 3));
  draw_text(x + 155, y + 6, scrAddSeparator(string_format(loops, 0, 0), ",", 3));
  draw_text(x + 155, y + 46, scrAddSeparator(string_format(totalScore, 0, 0), ",", 3));
}

draw_set_halign(oldAlign);
draw_set_color(oldColor);
draw_set_font(oldFont);