
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

var platformCollisionInstance = noone;
var numberOfPlatformsplatforms = instance_number(oJumpThroughPlatform);

for (var i = 0; i < numberOfPlatformsplatforms; i++) 
{
	var platformInstance = instance_find(oJumpThroughPlatform, i);
	
	if (
		place_meeting(x, y + playerSpeedY, platformInstance) && 
		floor(y) <= platformInstance.bbox_top
	)
	{	
		platformCollisionInstance = platformInstance;
	}	
}

if (platformCollisionInstance != noone) {	
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}

/*
var platformCheck = false;

if (
	playerSpeedY > 0 && 
	place_meeting(x, y + playerSpeedY, oJumpThroughPlatform) && 
	floor(y) <= oJumpThroughPlatform.bbox_top
) 
{
	platformCheck = true;
	
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}
*/

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
//show_debug_message("Platform check " + string(platformCheck));
//show_debug_message("Player position " + string(y));
//show_debug_message("Platform top " + string(oJumpThroughPlatform.bbox_top));
//show_debug_message("Platform bottom " + string(oJumpThroughPlatform.bbox_bottom));