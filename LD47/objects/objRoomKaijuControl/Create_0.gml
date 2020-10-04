/// @description Set up variables

//For level timing
timer = 0;
maxTimer = room_speed * 15;

startingGlompables = 18;
glompableSpawnTime = room_speed * 5;

instance_create_layer(800, 600, "Glompables", objPlayerPlaceholder);

scrSpawnStartingGlompables(self.id);

alarm[0] = glompableSpawnTime;

playing = false;
preTime = 2 * room_speed;
zoomTime = 1 * room_speed;
zoomStart = 1;
zoomTarget = 0.5;
zoom = zoomStart;


view_camera[0] = camera_create_view(0, 0, room_width, room_height, 0, objPlayerPlaceholder, 5, 5, 300, 225);
