
getPlayerInput();

playerMovementDirection = inputRightKey - inputLeftKey;

if (playerMovementDirection != 0) 
{
	playerSpriteFacing = playerMovementDirection;
}


/** X Collision **/
playerSpeedX = playerMovementDirection * playerMovementSpeed;


if (place_meeting(x + playerSpeedX, y, oGround)) 
{
	snapToColliderOnX(playerSpeedX, oGround);
	playerSpeedX = 0;
}


// Move the player along x
x += playerSpeedX;


/** Player movment Y **/
playerSpeedY += gravitySpeed;


if (playerOnGround) 
{
	playerJumps = 0;	
}


if (inputJumpKeyPressed > 0 && playerJumps < playerMaxJumps) 
{
	playerSpeedY = playerJumpForce;
	
	setPlayerOnGround(false, true);
}

if (playerSpeedY > gravityTerminalSpeed) {
	playerSpeedY = gravityTerminalSpeed;
}

/** Player collision Y **/
if (place_meeting(x, y + playerSpeedY, oGround)) 
{
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}

y += playerSpeedY;


// Switch the sprites
if (playerSpeedX == 0) 
{
	sprite_index = playerSpriteIdle;	
}

if (abs(playerSpeedX) > 0) 
{
	sprite_index = playerSpriteRun;		
}

if (abs(playerSpeedY) > 0) 
{
	sprite_index = playerSpriteJump;	
}

/** Debug messages for jumping **/
show_debug_message("Number of jumps " + string(playerJumps));
show_debug_message("Number of max jumps " + string(playerMaxJumps));
show_debug_message("On ground " + string(playerOnGround));