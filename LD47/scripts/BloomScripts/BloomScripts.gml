// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function scrCreateBloomMRTUniformSetter(dpth, intensity, threshold, range)
/// @param {int} layer - The layer this should be applied to
/// @param {real} intensity - The intensity of the bloom effect
/// @param {real} threshold - The threshold where the bloom effect kicks in
/// @param {range} range - The bloom range
function scrCreateBloomMRTUniformSetter(layer, intensity, threshold, range) {
  var dpth = layer_get_depth(layer);
  var instance = instance_create_depth(0, 0, dpth + 1, objBloomMRTUniformSetter);
  instance.parent = id;
  instance.bloomIntensity = intensity;
  instance.bloomThreshold = threshold;
  instance.bloomRange = range;
  
}