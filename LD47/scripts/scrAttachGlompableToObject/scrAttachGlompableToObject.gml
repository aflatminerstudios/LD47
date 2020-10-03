// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttachGlompableToObject(glompableInstance, attachableInstance){
	
	// You can only attach to the player or objects who inherit from objAttachable
	if (object_is_ancestor(attachableInstance.object_index, objAttachable) ||
	    object_is_ancestor(attachableInstance.object_index, objPlayerMicha)) {
		show_debug_message("Warning: The target instance (" + string(attachableInstance) + ") cannot be attached to. (Does it inherit from objAttachable?");
		return;
	}
	
	var playerInstance = attachableInstance.root;
	
	var innerColor = glompableInstance.innerColor;
	var outerColor = glompableInstance.outerColor;
	var radius = glompableInstance.radius;
	var spriteIndex = glompableInstance.sprite_index;
	var imageIndex = glompableInstance.image_index;
	var imageSpeed = glompableInstance.image_speed;
	var imageXScale = glompableInstance.image_xscale;
	var imageYScale = glompableInstance.image_yscale;
	var baseAngularSpeedPerFrame = glompableInstance.baseAngularSpeedPerFrame;
	var angularSpeedPerFrame = glompableInstance.angularSpeedPerFrame;
	var internalAngle = glompableInstance.internalAngle;
	var shouldGearRotateWhenAttaching = glompableInstance.shouldGearRotateWhenAttaching;
	
	with(glompableInstance) {
		instance_change(objAttachable, true);
		
		self.parentAttachable = attachableInstance;
		
		// Move values over to the new class
		self.innerColor = innerColor;
		self.outerColor = outerColor;
		self.radius = radius;
		self.sprite_index = spriteIndex;
		self.image_index = imageIndex;
		self.image_speed = imageSpeed;
		self.image_xscale = imageXScale
		self.image_yscale = imageYScale;
		self.baseAngularSpeedPerFrame = baseAngularSpeedPerFrame;
		self.angularSpeedPerFrame = angularSpeedPerFrame;
		self.internalAngle = internalAngle;
		
		// Get info about the angle/distance from the player (root)
		self.root = attachableInstance.root;
		self.distanceFromRoot = point_distance(playerInstance.x, playerInstance.y, self.x, self.y);
		self.angleFromRoot = point_direction(playerInstance.x, playerInstance.y, self.x, self.y) - playerInstance.angle;
		self.angleDiffFromRoot = self.angle - playerInstance.angle;
	}
}