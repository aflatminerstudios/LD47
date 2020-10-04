/// @description Variable documentation and setup


/***************************************************
****************************************************
/// Designable variables (sprites, sound, scripts)
// Modified from the object's "Variable Definitions"

Visual
  pressedSprite - down state sprite, defaults to object sprite if "None" in Variables
  unpressedSprite - normal state sprite, defaults to the object sprite if "None" in Variables

	useAutoPressAnimation - Moves the sprite by the autopressOffset, Defaults to false
		- Set useAutoPressAnimation to false for sprites with button press movement built in
		- Set to true, 2, 3 for a decent free animation
	autopressOffsetX = 2;
	autopressOffsetY = 3;
	
	
Sounds
	pressedSound - Played when the button is initially pressed
	unpressedSound - Played when the button is released
	
  useSoundVariance - Vary the sound on every press/release, turn off to not vary the sound
	minSoundVariance - multiplier, where 1.0 = no change, 2.0 = octave up (see afm_scrPlaySoundWithVariance for more info)
	maxSoundVariance
	
	shouldDuckPressedSoundOnUnpress - Stops the pressedSound when the button is unpressed
  shouldLoopPressedSound - Loops the pressedSound when pressed, automatically activates shouldDuckPressedSoundOnUnpress
	
	
Scripts
	pressedScript - Kicked off when the button is switched into the pressed state
	unpressedScript - Kicked off when the button is switched into the unpressed state
		- Button actions (scripts) feel better on button up (unpressed) for regular buttons
		- Radio buttons don't typically need these
	shouldSlideOutActivateUnpressedScript - Buttons with allowsSlideIn might want this
	  - Slide out = mouse/finger down while moving from inside to outside the button
		
		
Alternate Input
  pressedKey - (vk_space, vk_up, ord('G'), etc.) Button that can be used like a mouse click
	pressedBackupKey - Currently set in code below, works as a second available key to press (deprecated, to be replaced with a list on pressedButton -- Micha TODO)
	allowSlideIn - Most buttons will not want this
		- Slide in = ability to tap outside the button and slide into it to activate a press
    - Like running your finger across piano keys, most buttons will not want this

Selector Button interactions
  selectorButtonGroup - group for the radio button that can be used as a selector
	selectorButtonName - name for the radion button that must be pressed for "pressedKey" actions to work
	  - If selectorButtonGroup is set, check all afm_objRadioButtons in that group if they are pressed
			If any are, then keypresses are enabled for this button, otherwise only presses (needs to be refactored)

***************************************************
***************************************************/



/// Internal variables (set by the object)
isPressed = false; // Button state
currentSound = noone; // Reference to currently playing sound so we can duck/chop the sound
allowsKeypresses = true; // Enables pressedKey to activate this button like a press

/// Additional variable setup (defaults, etc.)
// Sprites
if(pressedSprite == noone)
	pressedSprite = sprite_index;
if(unpressedSprite == noone)
	unpressedSprite = sprite_index;
	
// Scripts
if(pressedScript == noone)
	pressedSprite = scrNullScript;
if(unpressedScript == noone)
	unpressedSprite = scrNullScript;

// See note in "Designable variables" above
// Refactor to be a multi-select list on pressedKey --  Micha TODO
pressedBackupKey = noone; // If either pressed or pressedBackupKey are pressed, pressed kicks in 


// Micha TODO  -- Determine whether Create or Variable Definitions is first/second