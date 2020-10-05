/// @description Game Over
// You can write your code in this editor

audio_play_sound(global.currentTheme.sndHit, 100, false);

if(instance_exists(objRoomBulletBossControl)) {
	frozen = true;
	objRoomBulletBossControl.alarm[1] = 1;
}

with (other) {
  instance_destroy(); 
}