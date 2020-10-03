// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttachGlompableToPlayer(glompableInstance, playerInstance){
	
	var innerColor = glompableInstance.innerColor;
	var outerColor = glompableInstance.outerColor;
	var radius = glompableInstance.radius;
	
	with(glompableInstance) {
		instance_change(objAttachable, true);
		
		// Move values over to the new class
		self.innerColor = innerColor;
		self.outerColor = outerColor;
		self.radius = radius;
		self.image_xscale = (radius*2.0)/self.sprite_width;
		self.image_yscale = (radius*2.0)/self.sprite_height;
		
		// Get info about the angle/distance from the player (root)
		self.root = playerInstance;
		// If we add non-circle objects, we'll need to adjust the self.radius/2 fix at the end of the next line
		self.distanceFromRoot = point_distance(playerInstance.x, playerInstance.y, self.x, self.y);
		self.angleFromRoot = point_direction(playerInstance.x, playerInstance.y, self.x, self.y) - playerInstance.angle;
		self.angleDiffFromRoot = self.angle - playerInstance.angle;
	}
}