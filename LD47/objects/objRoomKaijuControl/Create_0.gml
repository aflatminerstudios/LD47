/// @description Set up variables

//For level timing
timer = 0;
maxTimer = room_speed * 15;

startingGlompables = 15;
glompableSpawnTime = room_speed * 5;

scrSpawnStartingGlompables(self.id);


alarm[0] = glompableSpawnTime;

