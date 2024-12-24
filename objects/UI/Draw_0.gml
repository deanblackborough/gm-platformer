var percent;

if (instance_exists(oCamera) && instance_exists(oPlayer))
{
	percent = (oPlayer.playerHealth / oPlayer.playerMaxHealth) * 100;
	draw_healthbar(5 + oCamera.targetCameraX, 5 + oCamera.targetCameraY, 90 + oCamera.targetCameraX, 15 + oCamera.targetCameraY, percent, c_black, c_red, c_lime, 0, true, true);
}