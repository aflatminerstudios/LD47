/// @description Spawn a ship
// You can write your code in this editor

if(instance_exists(objRoomBulletBossControl) && objRoomBulletBossControl.playing) {
	

	// Update the ships per second based on the timer
	var time = objRoomBulletBossControl.timer;
	var speedMultiplier = 1.0;
	if(time > maxShipsTime)
		speedMultiplier = time/maxShipsTime;
	shipsPerSecond = lerp(minShipsPerSecond, maxShipsPerSecond, time/maxShipsTime);
	
	var ship = instance_create_layer(x, y, self.layer, objNoNoShip);
	ship.speed *= speedMultiplier;
}

alarm[0] = room_speed/shipsPerSecond;