
// Variables for object

// moveInX = Bool
// moveInY = Bool
// moveInXSpped = float
// moveInYSpeed = float
// moveInXAmount = int
// moveInYAmount = int
// sprite = asset (The sprite to use for the asset)
// showDebug

sprite_index = sprite;

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
