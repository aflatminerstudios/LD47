/// @description Spawn a ship
// You can write your code in this editor

if(instance_exists(objRoomBulletBossControl) && objRoomBulletBossControl.playing) {
	var ship = instance_create_layer(x, y, self.layer, objNoNoShip);
}

alarm[0] = room_speed/shipsPerSecond;