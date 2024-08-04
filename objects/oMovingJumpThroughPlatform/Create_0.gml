
// Variables for object

// moveInX = Bool
// moveInY = Bool
// moveInXSpped = float
// moveInYSpeed = float
// moveInXAmount = float
// moveInYAmount = float

targetX = xstart;
targetY = ystart;

if (moveInX == true)
{
	targetX = xstart + moveInXAmount;
	
	incrementX = true;
}

show_debug_message("Start X: " + string(xstart));
show_debug_message("Target X: " + string(targetX));

if (moveInY == true) 
{
	targetY = ystart + moveInYAmount;
	
	incrementY = true
}