/// @description Insert description here
// You can write your code in this editor


// These should be set during the changeover from objGlompable to objAttachable
innerColor = c_white;
outerColor = c_white;
radius = 20;

 // Set this to 0 if you want to keep it from rotating separately from what it is attached to
baseAngularSpeedPerFrame = 4;
angularSpeedPerFrame = baseAngularSpeedPerFrame;

internalAngle = 0; // This is our own rotation, separate from the overall stack

root = noone;
distanceFromRoot = 0;
angleFromRoot = 0;
angleDiffFromRoot = 0;
// Add parent/lifeline attachable (or player) to determine if it's been knocked off -- Micha TODO
// This is the instance that is next closer to the player on the branch
lifelineAttachable = noone;




angle = 0; // This is the overall rotation, after adding all effects together

// This is only for the collision detection
// This will need to be updated after changing over from objGlompable
image_xscale = (radius*2.0)/sprite_get_height(sprite_index);
image_yscale = (radius*2.0)/sprite_get_height(sprite_index);
