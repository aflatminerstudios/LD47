/// @description Insert description here
// You can write your code in this editor

var shouldDrawDebugReference = false;

//if(shouldDrawDebugReference)
//	draw_circle_color(x, y, radius, innerColor, outerColor, false);


draw_self();


if(shouldDrawDebugReference) {
	var referenceSprite = sprReferenceCircle;
	var refScale = (radius*2.0)/sprite_get_width(referenceSprite);
	draw_sprite_ext(referenceSprite, 0, x, y, refScale, refScale, image_angle, c_white, 0.5); // Remove -- Debug Micha TODO
}