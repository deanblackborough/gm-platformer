
if (instance_exists(oPlayer) == false) 
{
	exit;
}

var cameraWidth = camera_get_view_width(view_camera[0]);
var cameraHeight = camera_get_view_height(view_camera[0]);

cameraXPosition = clamp(oPlayer.x - cameraWidth / 2, 0, room_width - cameraWidth);
cameraYPosition = clamp(oPlayer.y - cameraHeight / 2, 0, room_height - cameraHeight);

targetCameraX += (cameraXPosition - targetCameraX) * followSpeed;
targetCameraY += (cameraYPosition - targetCameraY) * followSpeed;

camera_set_view_pos(view_camera[0], targetCameraX, targetCameraY);
