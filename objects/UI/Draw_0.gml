var percent;

if (instance_exists(oCamera))
{
	percent = (15 / 100) * 100;
	draw_healthbar(5 + oCamera.targetCameraX, 5 + oCamera.targetCameraY, 90 + oCamera.targetCameraX, 15 + oCamera.targetCameraY, percent, c_black, c_red, c_lime, 0, true, true);
}