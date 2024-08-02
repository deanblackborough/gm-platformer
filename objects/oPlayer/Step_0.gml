
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

if (place_meeting(x + playerSpeedX, y, oGround)) 
{
	if (snapToColliders) 
	{
		snapToColliderOnX(playerSpeedX, oGround);
	}
	playerSpeedX = 0;
}

if (instance_exists(movingJumpThroughPlatformInstance))
{
	x += movingJumpThroughPlatformInstance.xSpeed;
}


// Move the player along x
x += playerSpeedX;


/** Player movment Y **/
playerSpeedY += gravitySpeed;

// If player is on the ground and reset the jumps
if (playerOnGround) 
{
	playerJumps = 0;	
}

// Record platform we want to drop down through
if (inputJumpKeyPressed && inputDownKey && jumpThroughPlatformInstance != noone) 
{
	activeJumpThroughPlatformInstance = jumpThroughPlatformInstance
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
		place_meeting(x, y + playerSpeedY, localMovingJumpThroughPlatformInstance) && 
		floor(y) <= ceil(localMovingJumpThroughPlatformInstance.bbox_top - localMovingJumpThroughPlatformInstance.ySpeed) && 
		activeMovingJumpThroughPlatformInstance != localMovingJumpThroughPlatformInstance
	)
	{	
		movingJumpThroughPlatformInstance = localMovingJumpThroughPlatformInstance;
	}	
}

// Collide with a moving jump through platform
if (movingJumpThroughPlatformInstance != noone) 
{
	
	y += movingJumpThroughPlatformInstance.ySpeed;
	
	if (snapToColliders) 
	{
		snapToColliderOnY(playerSpeedY, movingJumpThroughPlatformInstance);
	}
	
	setPlayerOnGround(true);
	
	playerSpeedY = 0;
	
	show_debug_message("Player on ground: " + string(playerOnGround));
	show_debug_message("Moving platform y: " + string(movingJumpThroughPlatformInstance.y));
	show_debug_message("Player y: " + string(y));
}


// Move the player along x
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

if (abs(playerSpeedY) > 0 && playerOnGround != true) 
{
	sprite_index = playerSpriteJump;	
}