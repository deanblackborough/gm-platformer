// Variables for object

// enemySpeedX = float
// moveInXAmount = float

sprite_index = enemySpriteIdle;
image_speed = 1;


/*****************************************
*
* Ground collision in x
*
*****************************************/

if (place_meeting(x + enemySpeedX, y, oGround)) 
{
	
	if (snapToColliders) 
	{
		snapToColliderOnX(enemySpeedX, oGround);
	}
	
	enemySpeedX = 0;
}



/*****************************************
*
* Assign gravity to the enemy
*
*****************************************/

enemySpeedY += gravitySpeed;

if (enemySpeedY > gravityTerminalSpeed) {
	enemySpeedY = gravityTerminalSpeed;
}

/*****************************************
*
* Ground collision in y
*
*****************************************/

if (place_meeting(x, y + enemySpeedY, oGround))
{
	enemySpeedY = 0;
	
	setPlayerOnGround(true);
}

var nextFrameX = x;
if (incrementX == true)
{
	nextFrameX += enemySpeedX;
	deltaX = nextFrameX - xprevious;
		
	if (nextFrameX >= targetX) 
	{
		incrementX = false;	
	}
} else {
	nextFrameX -= enemySpeedX;
	deltaX = nextFrameX - xprevious;
		
	if (nextFrameX <= xstart)
	{
		incrementX = true;	
	}
}


/*****************************************
*
* Move the player
*
*****************************************/

x = nextFrameX;
y += enemySpeedY;


/*****************************************
*
* Switch the sprite
*
*****************************************/

if (incrementX = false) 
{
	enemySpriteFacing = -1;
} 
else 
{
	enemySpriteFacing = 1;
}

if (enemySpeedX == 0) 
{
	sprite_index = enemySpriteRun;	
	mask_index = enemySpriteRun;	
	image_speed = 1;
}
