angle += rotationSpeed;

if (moveInX == true)
{
	x = xstart + cos(angle) * radius;
}

if (moveInY == true) 
{
	y = ystart + sin(angle) * radius;
}


if (showDebug) 
{
	show_debug_message("Radius: " + string(radius));
	show_debug_message("Start angle: " + string(angle));
	show_debug_message("Rotation speed: " + string(rotationSpeed));
	show_debug_message("X start: " + string(xstart));
	show_debug_message("Y start: " + string(ystart));
}
