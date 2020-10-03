// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// @function scrIsUpPressed()
/// @desc Returns whether direction has been pressed
function scrIsUpPressed() {  
  if (keyboard_check_pressed(vk_up))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsDownPressed()
/// @desc Returns whether direction has been pressed
function scrIsDownPressed() {  
  if (keyboard_check_pressed(vk_down))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsLeftPressed()
/// @desc Returns whether direction has been pressed
function scrIsLeftPressed() {  
  if (keyboard_check_pressed(vk_left))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsRightPressed()
/// @desc Returns whether direction has been pressed
function scrIsRightPressed() {  
  if (keyboard_check_pressed(vk_right))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsUp()
/// @desc Returns whether direction key(s) is currently down
function scrIsUp() {  
  if (keyboard_check(vk_up))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsDown()
/// @desc Returns whether direction key(s) is currently down
function scrIsDown() {  
  if (keyboard_check(vk_down))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsLeft()
/// @desc Returns whether direction key(s) is currently down
function scrIsLeft() {  
  if (keyboard_check(vk_left))  {
    return true;
  } else {
    return false;
  }
}

/// @function scrIsRight()
/// @desc Returns whether direction key(s) is currently down
function scrIsRight() {  
  if (keyboard_check(vk_right))  {
    return true;
  } else {
    return false;
  }
}