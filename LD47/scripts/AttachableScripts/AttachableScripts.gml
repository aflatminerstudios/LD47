// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrAttachGlompableToObject(glompableInstance, parentAttachableInstance){
	
	// You can only attach to the player or objects who inherit from objAttachable
	if (parentAttachableInstance.object_index != objAttachable &&
			parentAttachableInstance.object_index != objPlayer &&
			!object_is_ancestor(parentAttachableInstance.object_index, objAttachable) &&
	    !object_is_ancestor(parentAttachableInstance.object_index, objPlayer)) {
		show_debug_message("Warning: The target instance (" + string(parentAttachableInstance.id) + ") cannot be attached to. (Does it inherit from objAttachable?");
		return;
	}
	
	var playerInstance = parentAttachableInstance.root;
	
	var circleTheme = glompableInstance.circleTheme
	var radius = glompableInstance.radius;
	var internalAngle = glompableInstance.internalAngle;
	var spriteIndex = glompableInstance.sprite_index;
	var imageIndex = glompableInstance.image_index;
	var imageAngle = glompableInstance.image_angle;
	var imageSpeed = glompableInstance.image_speed;
  var scale = (radius*2.0)/sprite_get_width(sprite_index);
	var imageXScale = scale;
	var imageYScale = scale;
	var internalAngle = glompableInstance.internalAngle;
	var baseAngularSpeedPerFrame = glompableInstance.baseAngularSpeedPerFrame;
	var angularSpeedPerFrame = glompableInstance.angularSpeedPerFrame;
	var shouldReverseRotationWhenAttaching = glompableInstance.shouldReverseRotationWhenAttaching;
	var shouldUseGearRatios = glompableInstance.shouldUseGearRatios;


	// Create a new instance of objAttachable
	// Make this accept a specific object_index defined in the glompable (child of objAttachable) --  Micha TODO
	var newObjectIndex = objAttachable;
	if(room == roomBulletBoss)
		newObjectIndex = objAttachableShooter;
	var newAttachable = instance_create_layer(glompableInstance.x, glompableInstance.y, glompableInstance.layer, newObjectIndex);
	instance_destroy(glompableInstance);
	with(newAttachable) {
	//with(glompableInstance) {
		//instance_change(objAttachable, true);
		self.parentAttachable = parentAttachableInstance;
    
		// Move values over to the new class
		self.circleTheme = circleTheme;
		self.radius = radius;
		self.sprite_index = spriteIndex;
		self.image_index = imageIndex;
		self.image_angle = imageAngle;
		self.image_speed = imageSpeed;
		self.image_xscale = imageXScale
		self.image_yscale = imageYScale;
		self.internalAngle = internalAngle;
		
		var angularSpeedSign = 1;
		if(shouldReverseRotationWhenAttaching || shouldUseGearRatios) {
			if(parentAttachableInstance.object_index == objPlayer)
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
	
	if(instance_exists(objRoomBulletBossControl))
		objRoomBulletBossControl.totalAttached++;
}

///@function scrDetachAttachable(attachable)
///@param attachable The attachable to detach
///@param collObject the object being collided with

function scrDetachAttachable(attachable, collObject, isActualCollision) {
  var newDetached = instance_create_layer(attachable.x, attachable.y, attachable.layer, objDetached);
  
  with (newDetached) {
    self.parentAttachable = attachable.parentAttachable;
		
		// Move values over to the new class
		self.circleTheme = attachable.circleTheme;
		
		self.radius = attachable.radius;
		self.sprite_index = attachable.sprite_index;
		self.image_index = attachable.image_index;
		self.image_speed = attachable.image_speed;
		self.image_xscale = attachable.image_xscale;
		self.image_yscale = attachable.image_yscale;
    
    self.internalAngle = attachable.internalAngle;
    self.angle = attachable.angle;
    self.speedPerFrame = attachable.angularSpeedPerFrame * 3;
    
    self.list = attachable.list;

    //self.maxList = attachable.maxList;
    //self.lineWidth = attachable.lineWidth;
    //self.dotColor = attachable.dotColor;
    self.stepsBetweenPoints = attachable.stepsBetweenPoints;
    self.alarm[0] = self.stepsBetweenPoints;
    
    
    if (isActualCollision) {
      self.alarm[1] = 2;
    }
    /*
    var instance = instance_create_depth(x, y, depth - 1, objHit);
    instance.image_angle = self.internalAngle + 90;
    self.skip = true;
    self.skipCount = 0;
    */
  }
  
  with (objAttachable) {
    
   if (parentAttachable.id == attachable) {
    scrDetachAttachable(self.id, collObject, false); 
   }   
  }
  
  with (attachable) {
    instance_destroy(); 
  }
}