
getPlayerInput();

playerMovementDirection = inputRightKey - inputLeftKey;

if (playerMovementDirection != 0) 
{
	playerSpriteFacing = playerMovementDirection;
}


/*****************************************
**
** Player collision X 
**
*****************************************/

playerSpeedX = playerMovementDirection * playerMovementSpeed;

if (abs(playerSpeedX) > 0 && inputShiftKey && playerOnGround) 
{
	playerIsDashing = true;
}

if (playerIsDashing) 
{
	playerDashTimer++;
	
	if (playerDashTimer < playerDashTimerMax) 
	{
		playerSpeedX = playerMovementDirection * playerMovementSpeedDash;
	}
}

if (!inputShiftKey && playerDashTimer > playerDashTimerMax)
{
	playerDashTimer = 0;
	playerIsDashing = false;
}

if (abs(playerSpeedX) > 0 && inputSlideKey && playerOnGround) 
{
	playerIsSliding = true;
}

if (playerIsSliding) 
{
	playerSlideTimer++;
	
	if (playerSlideTimer < playerSlideTimerMax) 
	{
		playerSpeedX = playerMovementDirection * playerMovementSpeedSlide;
	}
}

if (!inputSlideKey && playerSlideTimer > playerSlideTimerMax)
{
	playerSlideTimer = 0;
	playerIsSliding = false;
}

if (place_meeting(x + playerSpeedX, y, oGround)) 
{
	if (snapToColliders) 
	{
		snapToColliderOnX(playerSpeedX, oGround);
	}
	
	playerSpeedX = 0;
}


/** Player movment Y **/
if (abs(playerSpeedX) < playerMovementSpeedDash)
{
	playerSpeedY += gravitySpeed;
}

// If player is on the ground and reset the jumps
if (playerOnGround) 
{
	playerJumps = 0;	
}

// Record platform we want to drop down through
if (
	inputJumpKeyPressed && inputDownKey && 
	( 
		jumpThroughPlatformInstance != noone ||
		movingJumpThroughPlatformInstance != noone
	)
)
{
	activeJumpThroughPlatformInstance = jumpThroughPlatformInstance
	activeMovingJumpThroughPlatformInstance = movingJumpThroughPlatformInstance
}

// Jump the player
if (inputJumpKeyPressed > 0 && playerJumps < playerMaxJumps && !inputDownKey) 
{
	playerSpeedY = playerJumpForce;
	
	setPlayerOnGround(false, true);
}

// Limit y speed to terminal velocity
if (playerSpeedY > gravityTerminalSpeed) {
	playerSpeedY = gravityTerminalSpeed;
}

/*****************************************
**
** Player collision Y 
**
*****************************************/

// Collision with the ground objects
if (place_meeting(x, y + playerSpeedY, oGround))
{
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}

// See if we are colliding with a jump through platform
jumpThroughPlatformInstance = noone;
var numberOfJumpThroughPlatforms = instance_number(oJumpThroughPlatform);

for (var i = 0; i < numberOfJumpThroughPlatforms; i++) 
{
	var localJumpThroughPlatformInstance = instance_find(oJumpThroughPlatform, i);
	
	if (
		place_meeting(x, y + playerSpeedY, localJumpThroughPlatformInstance) && 
		floor(y) <= localJumpThroughPlatformInstance.bbox_top && 
		activeJumpThroughPlatformInstance != localJumpThroughPlatformInstance
	)
	{	
		jumpThroughPlatformInstance = localJumpThroughPlatformInstance;
	}	
}

// Collide with a jump through platform
if (jumpThroughPlatformInstance != noone) 
{
	if (snapToColliders) 
	{
		snapToColliderOnY(playerSpeedY, jumpThroughPlatformInstance);
	}
	
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}

// See if we are colliding with a moving jump through platform
movingJumpThroughPlatformInstance = noone;
var numberOfMovingJumpThroughPlatforms = instance_number(oMovingJumpThroughPlatform);

for (var i = 0; i < numberOfMovingJumpThroughPlatforms; i++) 
{
	var localMovingJumpThroughPlatformInstance = instance_find(oMovingJumpThroughPlatform, i);
	
	if (
		activeMovingJumpThroughPlatformInstance != localMovingJumpThroughPlatformInstance &&
		place_meeting(x, y + playerSpeedY, localMovingJumpThroughPlatformInstance) && 
		floor(y) <= ceil(localMovingJumpThroughPlatformInstance.bbox_top - localMovingJumpThroughPlatformInstance.deltaY)
	)
	{	
		movingJumpThroughPlatformInstance = localMovingJumpThroughPlatformInstance;
	}	
}

// Collide with a moving jump through platform
if (movingJumpThroughPlatformInstance != noone) 
{	
	x += movingJumpThroughPlatformInstance.deltaX;
	y += movingJumpThroughPlatformInstance.deltaY;
	
	setPlayerOnGround(true);
	
	playerSpeedY = 0;
}

if (
	movingJumpThroughPlatformInstance != noone && 
	place_meeting(x, y + playerSpeedY + movingJumpThroughPlatformInstance.deltaY, oGround) 
)
{
	if (abs(movingJumpThroughPlatformInstance.deltaY) != 0) 
	{
		movingJumpThroughPlatformInstance = noone;	
		y += 1;
	}
	
	if (movingJumpThroughPlatformInstance != noone && abs(movingJumpThroughPlatformInstance.deltaX) != 0) 
	{
		x += -movingJumpThroughPlatformInstance.deltaX;	
	}
}

/*****************************************
**
** Move the player
**
*****************************************/
x += playerSpeedX;
y += playerSpeedY;


/*****************************************
**
** Handle sprites
**
*****************************************/
if (playerSpeedX == 0) 
{
	sprite_index = playerSpriteIdle;	
}

if (abs(playerSpeedX) > 0) 
{
	sprite_index = playerSpriteRun;		
}

if (playerIsSliding) 
{
	sprite_index = playerSpriteSlide;
}

if (playerIsDashing) 
{
	sprite_index = playerSpriteDash;
}

if (abs(playerSpeedY) > 0 && playerOnGround != true) 
{
	sprite_index = playerSpriteJump;	
}



/*****************************************
**
** Debug messages
**
*****************************************/
if (showDebug) 
{
	show_debug_message("Player X: ", string(x));	
	show_debug_message("Player Y: ", string(y));	
	show_debug_message("Player Speed X: ", string(playerSpeedX));	
	show_debug_message("Player Spped Y: ", string(playerSpeedY));	
}