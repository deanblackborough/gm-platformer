
angle += rotationSpeed;

if (moveInX == true)
{
	x = xstart + cos(angle) * radius;
}

if (moveInY == true) 
{
	y = ystart + sin(angle) * radius;
}

xSpeed = point_distance(xprevious, yprevious, x, y);

if (showDebug) 
{
	show_debug_message("Radius: " + string(radius));
	show_debug_message("Start angle: " + string(angle));
	show_debug_message("Rotation speed: " + string(rotationSpeed));
	show_debug_message("X start: " + string(xstart));
	show_debug_message("X: " + string(x));
	show_debug_message("X Speed: " + string(xSpeed));
	show_debug_message("Y start: " + string(ystart));
	show_debug_message("Y: " + string(y));
}
