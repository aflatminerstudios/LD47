/// @description Fire a bullet
// You can write your code in this editor

var totalVelocity = root.angularSpeedPerFrame*distanceFromRoot
var forwardAngle = angleFromRoot-90;

//var dirToPlayer = point_direction(x, y, objPlayer.x, objPlayer.y);


var bullet = instance_create_layer(0, 0, self.layer, objYesYesBullet);
bullet.direction = angle;
bullet.speed = bulletSpeed;

var spawnPoint;
spawnPoint[0] = x + lengthdir_x(radius + bullet.radius + 1, angle);
spawnPoint[1] = y + lengthdir_y(radius + bullet.radius + 1, angle);
bullet.x = spawnPoint[0];
bullet.y = spawnPoint[1];
show_debug_message("Shooting");


alarm[9] = room_speed/bulletsPerSecond;