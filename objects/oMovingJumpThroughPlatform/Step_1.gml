var nextFrameX = x;
var nextFrameY = y;

if (moveInX == true)
{
	if (incrementX == true)
	{
		nextFrameX += moveInXSpeed;
		
		if (nextFrameX >= targetX) 
		{
			incrementX = false;	
		}
	} else {
		nextFrameX -= moveInXSpeed;
		
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
		
		if (nextFrameY >= targetY) 
		{
			incrementY = false;	
		}
	} else {
		nextFrameY = y - moveInYSpeed;
		
		if (nextFrameY <= ystart)
		{
			incrementY = true;	
		}
	}
	
	y = nextFrameY;
}