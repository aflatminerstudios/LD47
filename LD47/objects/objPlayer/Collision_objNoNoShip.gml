/// @description Game Over
// You can write your code in this editor

if(instance_exists(objRoomBulletBossControl)) {
	frozen = true;
	objRoomBulletBossControl.alarm[1] = 1;
}