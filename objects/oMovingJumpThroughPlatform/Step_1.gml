
angle += rotationSpeed;

var targetX = x;
var targetY = y;
if (moveInX == true)
{
	targetX = xstart + cos(angle) * radius;
}

if (moveInY == true) 
{
	targetY = ystart + sin(angle) * radius;
	
	deltaY = y - yprevious;
}

xSpeed = targetX - x;
ySpeed = targetY - y;

x += xSpeed;
y += ySpeed;

if (showDebug) 
{
	//show_debug_message("Radius: " + string(radius));
	//show_debug_message("Start angle: " + string(angle));
	//show_debug_message("Rotation speed: " + string(rotationSpeed));
	//show_debug_message("X start: " + string(xstart));
	//show_debug_message("X: " + string(x));
	//show_debug_message("X Speed: " + string(xSpeed));
	//show_debug_message("Y start: " + string(ystart));
	show_debug_message("Y: " + string(y));
	show_debug_message("Y Speed: " + string(ySpeed));
	show_debug_message("Delta Y: " + string(deltaY));
}
