// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// afm_scrHandleReleaseActionForButton(buttonInstance)
function afm_scrHandleReleaseActionForButton(argument0) {

	var buttonInstance = argument0;

	with (buttonInstance) {
		/// Start pressed state and run pressedScript
		if(isPressed) {
		  isPressed = false;
    
			if(shouldDuckPressedSoundOnUnpress || shouldLoopPressedSound) {
				show_debug_message("Ducking sound: " + string(currentSound));
				audio_stop_sound(currentSound); // Enhance to be a fast drop off (ducking) instead of abrupt cut off --  Micha TODO
			}
			currentSound = noone;
		
	    if(unpressedSound != noone) {
	      if(useSoundVariance)
	        currentSound = afm_scrPlaySoundWithRandomVarianceInRange(unpressedSound, minSoundVariance, maxSoundVariance);
	      else
	        currentSound = afm_scrPlaySoundWithVariance(unpressedSound, 1.0);
	    }
	    script_execute(unpressedScript);
		}
	}


}
/// afm_scrHandlePressActionForButton(buttonInstance)
function afm_scrHandlePressActionForButton(argument0) {

	var buttonInstance = argument0;

	with (buttonInstance) {
		/// Start pressed state and run pressedScript

		if(!isPressed) {
		  isPressed = true;
		
		  if(pressedSound != noone) {
		    if(useSoundVariance)
		      currentSound = afm_scrPlaySoundWithRandomVarianceInRange(pressedSound, minSoundVariance, maxSoundVariance, shouldLoopPressedSound);
		    else
		      currentSound = afm_scrPlaySoundWithVariance(pressedSound, 1.0, shouldLoopPressedSound);
		  }
		  script_execute(pressedScript);
		}
	}


}
/// afm_scrPlaySoundWithRandomVarianceInRange(soundIndex, minVariance, maxVariance, shouldLoop)
/// Plays a sound, modified somewhere +/- the specified percent (1.0 = 100%)
///
/// For reference, up a major third is 1.2599
/// No change is 1.0
function afm_scrPlaySoundWithRandomVarianceInRange() {

	var soundIndex = argument[0];
	var minVariance = argument[1];
	var maxVariance = argument[2];
	var shouldLoop = false;
	if(argument_count > 3)
		shouldLoop = argument[3];

	return afm_scrPlaySoundWithVariance(soundIndex, random_range(minVariance, maxVariance), shouldLoop);



}
/// afm_scrPlaySoundWithVariance(soundIndex, variance, shouldLoop)
/// Plays a sound, pitched up or down by the variance factor, where 1.0 = the original sound
///
/// For reference: 
/// Up a major third (4 halfsteps) = 1.2599
/// Up a fifth (7 halfsteps) = 1.4983
/// Up an octave (12 halfsteps) = 2.0
/// Down a fourth (-5 halfsteps) = 0.7492
/// Down a sixth (-8 halfsteps) = 0.62995
/// Down an octave (-12 halfsteps) = 0.5
function afm_scrPlaySoundWithVariance() {

	/// Up 1 halfstep = 1.059463
	///  2 1.1224620
	///  3 1.1892071
	///  4 1.2599210
	///  5 1.33483985
	///  6 1.41421356
	///  7 1.49830707
	///  8 1.58740105
	///  9 1.68179283
	/// 10 1.781797436
	/// 11 1.887748625
	/// 12 2.0

	var soundIndex = argument[0];
	var variance = argument[1];
	var shouldLoop = false;
	if(argument_count > 2)
		shouldLoop = argument[2];
			
	if(audio_exists(soundIndex)) {
	  var playedSound = audio_play_sound(soundIndex, 0, shouldLoop);
	  audio_sound_pitch(playedSound, variance);
		return playedSound;
	}

	return noone;


}
/// afm_scrCurveCubicInOut(startValue, endValue, percent)
function afm_scrCurveCubicInOut(argument0, argument1, argument2) {
	// Where percent is 0.0-1.0 (in decimal) of the 
	// time period to travel from start to end
	// scrCurveLinear(10, 20, 0.5) -> 15

	var startValue = argument0;
	var endValue = argument1;
	var percent = argument2;

	// Formula from http://www.gizma.com/easing/#cub3
	/*
	  Math.easeInOutCubic = function (t, b, c, d) {
	    	t /= d/2;
	    	if (t < 1) return c/2*t*t*t + b;
	    	t -= 2;
	    	return c/2*(t*t*t + 2) + b;
	  };
	*/
	var t = percent;
	var d = 1.0;
	var b = startValue;
	var c = endValue - startValue;
	t /= d/2;
	if (t < 1) return c/2*t*t*t + b;
	t -= 2;
	return c/2*(t*t*t + 2) + b;


}
