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

var text1 = "Loops attached: ";
var text2 = "Total loop size: ";
var text3 = "Length: ";
var text4 = "Total score: ";

var score1 = 0;
var score2 = 0;
var score3 = 0;
var score4 = 0;

if (style == "Kaiju") {

  totalScore = ((totalSize +  sqrt(bboxSize) + dist) * numAttached ) ;
  
  score1 = scrAddSeparator(string_format(numAttached, 0, 0), ",", 3);
  score2 = scrAddSeparator(string_format(totalSize, 0, 0), ",", 3);
  score3 = scrAddSeparator(string_format(dist, 0, 0), ",", 3);
  score4 = scrAddSeparator(string_format(totalScore, 0, 0), ",", 3);
    
}

if (style == "Obstacle") {
  
  if (won) {
    totalScore = sqrt((maxTimer - timer)/room_speed * (maxTimer - timer)/room_speed * (numAttached) * (dist) * sqrt(totalSize));
  } else {
    totalScore = sqrt(numAttached * dist * totalSize);
  }
  
  if (sprite_index == sprGOFail) {
    draw_set_color(c_black);
  }

  text1 = "Time: ";
  text2 = "Loops attached: ";
  text3 = "Length: ";
  text4 = "Total score: ";
  
  var seconds = timer/room_speed;
	var timeString = string_format(seconds, 0, 2) + " s"
  score1 = timeString;
  score2 = scrAddSeparator(string_format(numAttached, 0, 0), ",", 3);
  score3 = scrAddSeparator(string_format(dist, 0, 0), ",", 3);
  score4 = scrAddSeparator(string_format(totalScore, 0, 0), ",", 3);
  
  }

if (style == "BulletBoss") {

	var loops = numAttached;

  //totalScore = ((totalSize + sqrt(bboxSize) + dist) * numAttached * numAttached);
	totalScore = timer * 2 + ships * 1 + loops*5;

  text1 = "Time survived: ";
  text2 = "Ships destroyed: ";
  text3 = "Loops attached: ";
  text4 = "Total score: ";
  
  var seconds = timer/room_speed;
	var timeString = string_format(seconds, 0, 2) + " s"
  score1 = timeString;
  score2 = scrAddSeparator(string_format(ships, 0, 0), ",", 3)
  score3 = scrAddSeparator(string_format(loops, 0, 0), ",", 3)
  score4 = scrAddSeparator(string_format(totalScore, 0, 0), ",", 3);

  //Scores
  draw_set_halign(fa_right);
}

//Labels
draw_text(x - 360, y - 50, text1); 
draw_text(x - 360, y - 20, text2);
draw_text(x - 360, y + 10, text3);
draw_text(x - 360, y + 40, text4);

//Scores
draw_set_halign(fa_right);
draw_text(x - 15, y - 50, score1);
draw_text(x - 15, y - 20, score2);
draw_text(x - 15, y + 10, score3);
draw_text(x - 15, y + 40, score4);



//Reset everything
if (objShaderControl.fadeAmount != 0) {
  shader_reset();
}

draw_set_halign(oldAlign);
draw_set_color(oldColor);
draw_set_font(oldFont);