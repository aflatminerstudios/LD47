/// @description Insert description here
// You can write your code in this editor

var shouldDrawDebugReference = false;



image_angle = angle;
sprite_index = circleTheme.mainSprite;

// Draw the insert for colorblind mode
if(global.colorBlindModeOn) {
	var assistSprite = circleTheme.colorAssistSprite;
	if(assistSprite != noone) {
		//var refScale = (radius*2.0)/sprite_get_width(assistSprite); // Assumes the size of the sprite is a circle that goes to the edges
		var refScale = image_xscale; // Assumes the circle sprite and insert have the same relative size
		draw_sprite_ext(assistSprite, 0, x, y, refScale, refScale, image_angle, c_white, image_alpha);
	}
}

draw_self();

if(shouldDrawDebugReference) {
	var referenceSprite = sprCircleReference;
	var refScale = (radius*2.0)/sprite_get_width(referenceSprite);
	draw_sprite_ext(referenceSprite, 0, x, y, refScale, refScale, image_angle, c_white, 0.5); // Remove -- Debug Micha TODO
}

// Debug code, draws text in the center of the circle
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// angularSpeed
//draw_text_transformed(x, y, string(self.angularSpeedPerFrame), 1, 1, 0);
// instance id
//draw_text_transformed(x, y, string(self.id-100000), 1, 1, 0);
// angle
//draw_text_transformed(x, y, string(internalAngle), 1, 1, 0);
// theme name
//draw_text_transformed(x, y, circleTheme.name, 1, 1, 0);
// radius
draw_text_transformed(x, y, radius, 1, 1, 0);