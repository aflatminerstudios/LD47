/// @description Insert description here
// You can write your code in this editor


if (x < -1 * sprite_width || x > room_width + sprite_width || y < -1 * sprite_height || y > room_height + sprite_height) {  
  instance_destroy();
}