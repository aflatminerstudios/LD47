/// @description Insert description here
// You can write your code in this editor

distanceFromRoot = 0;
angleFromRoot = 0;
angleDiffFromRoot = 0;

angle = 0;
root = noone;
// Add parent/lifeline attachable (or player) to determine if it's been knocked off -- Micha TODO
// This is the instance that is next closer to the player on the branch
lifelineAttachable = noone;



// These should be set during the changeover from objGlompable to objAttachable
innerColor = c_white;
outerColor = c_white;
radius = 20;


// This is only for the collision detection
// This will need to be updated after changing over from objGlompable
image_xscale = (radius*2.0)/sprite_get_height(sprite_index);
image_yscale = (radius*2.0)/sprite_get_height(sprite_index);
