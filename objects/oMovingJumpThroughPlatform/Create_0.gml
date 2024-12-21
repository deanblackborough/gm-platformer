
// Variables for object

// moveInX = Bool
// moveInY = Bool
// moveInXSpped = float
// moveInYSpeed = float
// moveInXAmount = float
// moveInYAmount = float

targetX = xstart;
targetY = ystart;

deltaX = 0;
deltaY = 0;

if (moveInX == true)
{
	targetX = xstart + moveInXAmount;
	
	incrementX = true;
}

if (moveInY == true) 
{
	targetY = ystart + moveInYAmount;
	
	incrementY = true
}

showDebug = false;