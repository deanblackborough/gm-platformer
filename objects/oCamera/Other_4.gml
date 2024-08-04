
if (instance_exists(oPlayer) == false) 
{
	exit;
}

var cameraWidth = camera_get_view_width(view_camera[0]);
var cameraHeight = camera_get_view_height(view_camera[0]);

var cameraXPosition = oPlayer.x - cameraWidth / 2;
var cameraYPosition = oPlayer.y - cameraHeight / 2;

cameraXPosition = clamp(cameraXPosition, 0, room_width - cameraWidth);
cameraYPosition = clamp(cameraYPosition, 0, room_height - cameraHeight);

targetCameraX += (cameraXPosition - targetCameraX) * followSpeed;
targetCameraY += (cameraYPosition - targetCameraY) * followSpeed;
