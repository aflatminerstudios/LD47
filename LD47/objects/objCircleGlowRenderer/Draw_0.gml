/// @description Insert description here
// You can write your code in this editor


with(objCircleParent) {
	var glowSprite = self.circleTheme.glowSprite;
	if(glowSprite != noone) {
		//var refScale = (radius*2.0)/sprite_get_width(assistSprite); // Assumes the size of the sprite is a circle that goes to the edges
		var glowScale = image_xscale; // Assumes the circle sprite and insert have the same relative size
		draw_sprite_ext(glowSprite, 0, x, y, glowScale, glowScale, image_angle, c_white, image_alpha);
	}
}

