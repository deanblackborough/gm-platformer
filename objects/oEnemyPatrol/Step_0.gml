
getPlayerInput();

sprite_index = enemySpriteIdle;
image_speed = 1;

/*****************************************
*
* Enemy movement direction an sprite facing
*
*****************************************/

enemyMovementDirection = enemySpriteFacing

/*****************************************
*
* Set the enemy speed in x
*
*****************************************/

enemySpeedX = enemyMovementDirection * enemyMovementSpeed;


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


/*****************************************
*
* Move the player
*
*****************************************/

x += enemySpeedX;
y += enemySpeedY;


/*****************************************
*
* Switch the sprite
*
*****************************************/

if (enemySpeedX == 0) 
{
	sprite_index = enemyrSpriteIdle;	
	mask_index = enemySpriteIdle;	
	image_speed = 1;
}
