/// @description Insert description here
// You can write your code in this editor

// Move via keyboard arrows
var dirX = keyboard_check(vk_right) - keyboard_check(vk_left);
var dirY = keyboard_check(vk_down) - keyboard_check(vk_up);

x = x + dirX*speedPerFrame;
y = y + dirY*speedPerFrame;


// Rotate some per frame
image_angle = image_angle + angularSpeedPerFrame;