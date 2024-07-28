
getPlayerInput();

playerMovementDirection = inputRightKey - inputLeftKey;

if (playerMovementDirection != 0) 
{
	playerSpriteFacing = playerMovementDirection;
}

playerSpeedX = playerMovementDirection * playerMovementSpeed;



if (place_meeting(x + playerSpeedX, y, oGround)) 
{
	snapToColliderOnX(oPlayer, playerSpeedX, oGround);
	playerSpeedX = 0;
}


// Move the player along x
x += playerSpeedX;


// Switch the sprites
if (playerSpeedX == 0) 
{
	sprite_index = playerSpriteIdle;	
}

if (abs(playerSpeedX) > 0) 
{
	sprite_index = playerSpriteRun;		
}