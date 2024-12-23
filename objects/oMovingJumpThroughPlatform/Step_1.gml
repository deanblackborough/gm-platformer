
// Variables for object

// moveInX = Bool
// moveInY = Bool
// moveInXSpped = float
// moveInYSpeed = float
// moveInXAmount = int
// moveInYAmount = int

var nextFrameX = x;
var nextFrameY = y;

if (moveInX == true)
{
	if (incrementX == true)
	{
		nextFrameX += moveInXSpeed;
		deltaX = nextFrameX - xprevious;
		
		if (nextFrameX >= targetX) 
		{
			incrementX = false;	
		}
	} else {
		nextFrameX -= moveInXSpeed;
		deltaX = nextFrameX - xprevious;
		
		if (nextFrameX <= xstart)
		{
			incrementX = true;	
		}
	}
	
	x = nextFrameX;
}

if (moveInY == true)
{
	if (incrementY == true)
	{
		nextFrameY = y + moveInYSpeed;
		deltaY = nextFrameY - yprevious;
		
		if (nextFrameY >= targetY) 
		{
			incrementY = false;	
		}
	} else {
		nextFrameY = y - moveInYSpeed;
		deltaY = nextFrameY - yprevious;
		
		if (nextFrameY <= ystart)
		{
			incrementY = true;	
		}
	}
	
	y = nextFrameY;
}