/// @description Set up variables

//For level timing
timer = 0;
maxTimer = room_speed * 15;

startingGlompables = 18;
glompableSpawnTime = room_speed * 5;

instance_create_layer(800, 600, "Glompables", objPlayerMicha);

scrSpawnStartingGlompables(self.id);

alarm[0] = glompableSpawnTime;

