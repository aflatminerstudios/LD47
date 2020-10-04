// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttachGlompableToObject(glompableInstance, parentAttachableInstance){
	
	// You can only attach to the player or objects who inherit from objAttachable
	if (object_is_ancestor(parentAttachableInstance.object_index, objAttachable) ||
	    object_is_ancestor(parentAttachableInstance.object_index, objPlayerMicha)) {
		show_debug_message("Warning: The target instance (" + string(parentAttachableInstance) + ") cannot be attached to. (Does it inherit from objAttachable?");
		return;
	}
	
	var playerInstance = parentAttachableInstance.root;
	
	// Add theme info --  Micha TODO
	
	var glowSprite = glompableInstance.glowSprite;
	var radius = glompableInstance.radius;
	var spriteIndex = glompableInstance.sprite_index;
	var imageIndex = glompableInstance.image_index;
	var imageSpeed = glompableInstance.image_speed;
	var imageXScale = glompableInstance.image_xscale;
	var imageYScale = glompableInstance.image_yscale;
	var baseAngularSpeedPerFrame = glompableInstance.baseAngularSpeedPerFrame;
	var angularSpeedPerFrame = glompableInstance.angularSpeedPerFrame;
	var internalAngle = glompableInstance.internalAngle;
	var shouldReverseRotationWhenAttaching = glompableInstance.shouldReverseRotationWhenAttaching;
	var shouldUseGearRatios = glompableInstance.shouldUseGearRatios;


		
	var newAttachable = instance_create_layer(glompableInstance.x, glompableInstance.y, glompableInstance.layer, objAttachable);
	instance_destroy(glompableInstance);
	with(newAttachable) {
	//with(glompableInstance) {
		//instance_change(objAttachable, true);
		self.parentAttachable = parentAttachableInstance;
		
		// Move values over to the new class
		self.glowSprite = glowSprite; // Temporary until we get the whole theme moved over -- Micha TODO
		self.radius = radius;
		self.sprite_index = spriteIndex;
		self.image_index = imageIndex;
		self.image_speed = imageSpeed;
		self.image_xscale = imageXScale
		self.image_yscale = imageYScale;
		
		var angularSpeedSign = 1;
		if(shouldReverseRotationWhenAttaching || shouldUseGearRatios) {
			if(parentAttachableInstance.object_index == objPlayerMicha)
				angularSpeedSign = sign(parentAttachableInstance.angularSpeedPerFrame);
			else
				angularSpeedSign = -1*sign(parentAttachableInstance.angularSpeedPerFrame);
		}
		
		if(shouldUseGearRatios) {
			var ratio = parentAttachableInstance.radius/radius;
			self.baseAngularSpeedPerFrame = angularSpeedSign*abs(baseAngularSpeedPerFrame); // This may cause trouble if we try to revert the speed to the base speed for some reason
			self.angularSpeedPerFrame = ratio*angularSpeedSign*abs(parentAttachableInstance.angularSpeedPerFrame);
		} else {
			self.baseAngularSpeedPerFrame = angularSpeedSign*abs(baseAngularSpeedPerFrame);
			self.angularSpeedPerFrame = angularSpeedSign*abs(angularSpeedPerFrame);
		}
		self.internalAngle = internalAngle;
		
		// Get info about the angle/distance from the player (root)
		self.root = parentAttachableInstance.root;
		self.distanceFromRoot = point_distance(playerInstance.x, playerInstance.y, self.x, self.y);
		self.angleFromRoot = point_direction(playerInstance.x, playerInstance.y, self.x, self.y) - playerInstance.angle;
		self.angleDiffFromRoot = self.angle - playerInstance.angle;
    
	}
}