// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttachGlompableToPlayer(glompableInstance, playerInstance){
	
	var innerColor = glompableInstance.innerColor;
	var outerColor = glompableInstance.outerColor;
	var radius = glompableInstance.radius;
	var baseAngularSpeedPerFrame = glompableInstance.baseAngularSpeedPerFrame;
	var angularSpeedPerFrame = glompableInstance.angularSpeedPerFrame;
	var internalAngle = glompableInstance.internalAngle;
	
	with(glompableInstance) {
		instance_change(objAttachable, true);
		
		// Move values over to the new class
		self.innerColor = innerColor;
		self.outerColor = outerColor;
		self.radius = radius;
		self.image_xscale = (radius*2.0)/sprite_get_width(objAttachable.sprite_index);
		self.image_yscale = (radius*2.0)/sprite_get_height(objAttachable.sprite_index);
		
		self.baseAngularSpeedPerFrame = baseAngularSpeedPerFrame;
		self.angularSpeedPerFrame = angularSpeedPerFrame;
		self.internalAngle = internalAngle;
		
		// Get info about the angle/distance from the player (root)
		self.root = playerInstance;
		self.distanceFromRoot = point_distance(playerInstance.x, playerInstance.y, self.x, self.y);
		self.angleFromRoot = point_direction(playerInstance.x, playerInstance.y, self.x, self.y) - playerInstance.angle;
		self.angleDiffFromRoot = self.angle - playerInstance.angle;
	}
}