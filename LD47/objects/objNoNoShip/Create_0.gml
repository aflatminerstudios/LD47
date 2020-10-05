/// @description Insert description here
// You can write your code in this editor

baseSpeed = 1;
speed = baseSpeed;

direction = irandom(360);
image_angle = direction;

bulletMaxTime = room_speed * 2;
bulletMinTime = room_speed / 2;

if (objRoomBulletBossControl.timer != 0) {
  var r = irandom_range(bulletMinTime, bulletMaxTime)
  alarm[0] = r;
}