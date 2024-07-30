
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
var playerNextPositionY = y + playerSpeedY;

if (place_meeting(x, playerNextPositionY, oGround))
{
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}

if (
	place_meeting(x, playerNextPositionY, oJumpThroughPlatform) && 
	floor(playerNextPositionY) <= oJumpThroughPlatform.bbox_top
)
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
//show_debug_message("Number of jumps " + string(playerJumps));
//show_debug_message("Number of max jumps " + string(playerMaxJumps));
//show_debug_message("On ground " + string(playerOnGround));
show_debug_message("Player position " + string(y));
show_debug_message("Player position diff " + string(playerNextPositionY - y));
show_debug_message("Player next position " + string(playerNextPositionY));
show_debug_message("Player next position floor " + string(floor(playerNextPositionY)));
//show_debug_message("Platform top " + string(oJumpThroughPlatform.bbox_top));
//show_debug_message("Platform bottom " + string(oJumpThroughPlatform.bbox_bottom));