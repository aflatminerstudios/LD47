/// @description Insert description here
// You can write your code in this editor

var shouldDrawDebugReference = false;

//if(shouldDrawDebugReference)
//	draw_circle_color(x, y, radius, innerColor, outerColor, false);

draw_self();
if(global.colorBlindModeOn) {
	var assistSprite = sprCircleInsertSquare;
	var refScale = (radius*2.0)/sprite_get_width(assistSprite);
	draw_sprite_ext(assistSprite, 0, x, y, refScale, refScale, image_angle, c_white, image_alpha);
}

if(shouldDrawDebugReference) {
	var referenceSprite = sprCircleReference;
	var refScale = (radius*2.0)/sprite_get_width(referenceSprite);
	draw_sprite_ext(referenceSprite, 0, x, y, refScale, refScale, image_angle, c_white, 0.5);
}