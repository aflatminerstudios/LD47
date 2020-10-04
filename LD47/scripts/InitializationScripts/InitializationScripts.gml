// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function scrInitialize()
/// @desc Does nothing
function scrInitialize(){
  enum AspectRatio {
    FULL_SCREEN,
    WIDE_SCREEN
  }
  
  global.aspectRatio = AspectRatio.FULL_SCREEN;
  global.prevAspectRatio = global.aspectRatio;
  
  scrUpdateWindowSettings();

  randomize();
}

function scrUpdateWindowSettings() {

	// Update the window size if needed
	// (Checks to see if global.aspectRatio has changed since the last run of this script)
	if(global.prevAspectRatio != global.aspectRatio) {
		global.prevAspectRatio = global.aspectRatio;
	
		if(global.aspectRatio == AspectRatio.FULL_SCREEN) {
			surface_resize(application_surface, 800, 600);
			window_set_size(800, 600)
		} else {
			surface_resize(application_surface, 800, 600);
			window_set_size(800, 600)
		}
		display_set_gui_size(-1, -1); // Force the GUI size to be the same as the application surface
	}


	// Make sure the room is using the correct viewport
	// Viewport 0 is full screen (AspectRatio.FULL_SCREEN)
	// Viewport 1 is wide screen (AspectRatio.WIDE_SCREEN)

	if(room == roomMainRoom) {
		// Select the proper viewport for the current aspect ratio
		if(global.aspectRatio == AspectRatio.FULL_SCREEN) {
			view_visible[0] = true;
			view_visible[1] = false;
		} else {
			view_visible[0] = false;
			view_visible[1] = true;
		}
	}
}

