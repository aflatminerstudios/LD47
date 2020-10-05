/// @description Insert description here
// You can write your code in this editor

var bullet = instance_create_depth(x, y, depth, objNoNoBullet);
bullet.direction = direction;

var r = irandom_range(bulletMinTime, bulletMaxTime);
alarm[0] = r;