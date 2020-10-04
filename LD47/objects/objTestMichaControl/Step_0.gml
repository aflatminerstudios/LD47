/// @description Checks for key presses to go to other rooms

if (keyboard_check_pressed(vk_escape)) {
	room_goto(roomTitleScreen);
}

if(room != roomTestMicha)
	return;
	
	
	
// Skip everything	
if(!shouldShowDebugControls)
	return;
	
var shouldRecalcRootAngularSpeed = false;

if (keyboard_check_pressed(ord("1"))) {
	rootGearMode = !rootGearMode;
	with(objAttachable) {
		self.baseAngularSpeedPerFrame *= -1;
		if(other.branchGearMode != 0)
			self.angularSpeedPerFrame *= -1;
	}
} else if (keyboard_check_pressed(ord("2"))) {
	branchGearMode++;
	if(branchGearMode > 2)
		branchGearMode = 0;
	
	// Needs to go out from root, following the brances out (distance won't work)
	// Also needs to set the angularspeed from the parent's angularSpeed (instead of the base)
	var count = instance_number(objAttachable);
	for(var i = 0; i < count; i++) {
		var instance = instance_find(objAttachable, i);
		with(instance) {
			switch(other.branchGearMode) {
				case 0:
					// off
					self.angularSpeedPerFrame = 0;
					break;
				case 1:
					// Independent
					self.angularSpeedPerFrame = self.baseAngularSpeedPerFrame;
					break;
				case 2:
					// Based on what I'm attached to
					var ratio = self.parentAttachable.radius/self.radius;
					self.angularSpeedPerFrame = ratio * self.parentAttachable.angularSpeedPerFrame;
					break;
				default:
					break;
			}
		}
	}
	/*
	with(objAttachable) {
		switch(other.branchGearMode) {
			case 0:
				// off
				self.angularSpeedPerFrame = 0;
				break;
			case 1:
				// Independent
				self.angularSpeedPerFrame = self.baseAngularSpeedPerFrame;
				break;
			case 2:
				// Based on what I'm attached to
				var ratio = self.parentAttachable.radius/self.radius;
				// Might be glitchy due to order of objects
				self.angularSpeedPerFrame = ratio * self.parentAttachable.baseAngularSpeedPerFrame;
				break;
			default:
				break;
		}
	}
	*/
} else if (keyboard_check_pressed(ord("3"))) {
	slowAsGrowMode++;
	if(slowAsGrowMode > 3)
		slowAsGrowMode = 0;
		
	shouldRecalcRootAngularSpeed = true;
	
} else if (keyboard_check_pressed(ord("9"))) {
	slowAsGrowModeMultiplier += 0.1;
	shouldRecalcRootAngularSpeed = true;
} else if (keyboard_check_pressed(ord("8"))) {
	slowAsGrowModeMultiplier -= 0.1
	if(slowAsGrowModeMultiplier <= 0)
		slowAsGrowModeMultiplier = 0.1;
	shouldRecalcRootAngularSpeed = true;
}

shouldRecalcRootAngularSpeed = true; // Doing it every frame so we can act on new circles
if(shouldRecalcRootAngularSpeed) {
	with(objPlayer) {
		switch(other.slowAsGrowMode) {
			case 0:
				// off
				self.angularSpeedPerFrame = other.slowAsGrowModeMultiplier*self.baseAngularSpeedPerFrame;
				break;
			case 1:
				// Longest branch
				self.angularSpeedPerFrame = other.slowAsGrowModeMultiplier*self.baseAngularSpeedPerFrame; // Same as off right now -- Micha TODO
				break;
			case 2:
				// Circle count
				var circleCount = instance_number(objAttachable);
				if(circleCount < 1)
					circleCount = 1;
				var slowDownEffect = other.slowAsGrowModeMultiplier/(circleCount*.1)
				self.angularSpeedPerFrame = slowDownEffect*self.baseAngularSpeedPerFrame;
				break;
			case 3:
				// Total area/weight
				var totalArea = 0;
				with(objAttachable) {
					totalArea += self.radius*self.radius;
				}
				var slowDownEffect = other.slowAsGrowModeMultiplier/(totalArea*0.001);
				self.angularSpeedPerFrame = slowDownEffect*self.baseAngularSpeedPerFrame;
				break;
			default:
				break;
		}
	}
}