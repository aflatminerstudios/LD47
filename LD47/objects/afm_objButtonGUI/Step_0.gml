/// @description Check for keyboard press/release

// Turn keyboard support on and off based on radio button selector
if(selectorButtonGroup != "" && selectorButtonName != "") {
	show_debug_message("Checking radio buttons");
	var selectorButtonIsOn = false;
	with(afm_objRadioButton){
		if(buttonGroup == other.selectorButtonGroup && buttonName == other.selectorButtonName) {	
			if(isPressed)
				selectorButtonIsOn = true;
		}
	}
	allowsKeypresses = selectorButtonIsOn;
	if(selectorButtonIsOn)
		show_debug_message("    Allowing keypresses based on group/name: " + selectorButtonGroup + "/" + selectorButtonName);
	else
		show_debug_message("NOT allowing keypresses based on group/name: " + selectorButtonGroup + "/" + selectorButtonName);
}

/// Check for keyboard press - Start pressed state and run pressedScript
if(!isPressed && allowsKeypresses) {
  if(pressedKey != noone) {
    if(keyboard_check_pressed(pressedKey))
      afm_scrHandlePressActionForButton(self.id);
  } else if(pressedBackupKey != noone) {
    if(keyboard_check_pressed(pressedBackupKey))
      afm_scrHandlePressActionForButton(self.id);
  }
}


/// Check for keyboard release - Stop pressed state and run unpressedScript
if(isPressed && allowsKeypresses) {
  if(pressedKey != noone) {
    if(keyboard_check_released(pressedKey))
      afm_scrHandleReleaseActionForButton(self.id);
  } else if(pressedBackupKey != noone) {
    if(keyboard_check_released(pressedBackupKey))
      afm_scrHandleReleaseActionForButton(self.id);
  }
}