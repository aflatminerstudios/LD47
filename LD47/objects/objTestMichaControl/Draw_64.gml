/// @description Insert description here
// You can write your code in this editor

if(room != roomTestMicha)
	return;
	
	
// Skip everything	
if(!shouldShowDebugControls)
	return;
	

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var statusString = "";
if(rootGearMode) {
	statusString += "[1] Root level: Gear rotation"
} else {
	statusString += "[1] Root level: Rolling rotation"
}

statusString += "\n";

switch(branchGearMode) {
	case 0:
		statusString += "[2] Branch rotation: Off"
		break;
	case 1:
		statusString += "[2] Branch rotation: Independent Speed"
		break;
	case 2:
		statusString += "[2] Branch rotation: Gear ratio"
		break;
	default:
		break;
}

statusString += "\n";

switch(slowAsGrowMode) {
	case 0:
		statusString += "[3] Slow rotation: Off"
		break;
	case 1:
		statusString += "[3] Slow rotation: Longest Branch (not active yet)"
		break;
	case 2:
		statusString += "[3] Slow rotation: Circle count (not active yet)"
		break;
	case 3:
		statusString += "[3] Slow rotation: Total area/weight (not active yet)"
		break;
	default:
		break;
}

statusString += "\n[8 9] Slow rotation multiplier: " + string(slowAsGrowModeMultiplier)
statusString += "\nCurrent rotation speed: " + string(objPlayer.angularSpeedPerFrame) + " deg/frame";
statusString += "\nLast Key: " + string(ord(keyboard_lastchar));

draw_text(10, 10, statusString);