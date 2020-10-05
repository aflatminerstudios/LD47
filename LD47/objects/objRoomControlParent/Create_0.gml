/// @description Set up variables

//For level timing
timer = 0;
maxTimer = room_speed * 15;

startingGlompables = 18;
glompableSpawnTime = room_speed * 5;

placeholder = instance_create_layer(room_width/2, room_height/2, "Glompables", objPlayerPlaceholder);


alarm[0] = glompableSpawnTime;

playing = false;
preTime = 1 * room_speed;
zoomTime = 2 * room_speed;
zoomStart = 1;
zoomTarget = 0.5;
zoom = zoomStart;
alarm[3] = room_speed;
audio_play_sound(sndBeep, 100, false);
alarm[4] = preTime + zoomTime;

// Set up the BG based on the current theme
// This coud be moved to a script and called anytime inside a game mode
var colorBGLayerId = layer_get_id("Background");
var colorBGId = layer_background_get_id(colorBGLayerId);
layer_background_blend(colorBGId, global.currentTheme.backgroundImage);

var imageBGLayerId = layer_get_id("BackgroundImage");
var imageBGId = layer_background_get_id(imageBGLayerId);
layer_background_sprite(imageBGId, global.currentTheme.backgroundImage);
layer_background_htiled(imageBGId, true);
layer_background_vtiled(imageBGId, true);


view_camera[0] = camera_create_view(0, 0, room_width, room_height, 0, noone, 5, 5, 300, 225);

//For ticker text
ticker = instance_create_layer(400, 53.5, "UI", objTicker);


//Create other controllers
instance_create_layer(0, 0, "Controllers", objSpiroControl);

//Create glow renderer
var glowDepth = layer_get_depth(layer_get_id("Glompables")) + 50;
instance_create_depth(0, 0, glowDepth, objCircleGlowRenderer);

textList = ds_list_create();

ds_list_add(textList, "The only limit is yourself.", "Don't stop believing!", "I definitely believe in you. I'm not just saying that.", "Maybe you should try harder?");
canSpawnText = true;

//REMOVE: Sets volume of everything to zero
var num = audio_get_listener_count();
for( var i = 0; i < num; i++;)
{
  var info = audio_get_listener_info(i);
  audio_set_master_gain(info[? "index"], 0);
  ds_map_destroy(info);
}
   
won = false;

readyGo = noone;