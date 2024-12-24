// Variables for object

// showDebug = boolean (Show movement limits, slide target / dash target etc)

getPlayerInput();

sprite_index = playerSpriteIdle;
image_speed = 1;

/*****************************************
*
* Player movement direction and 
* sprite direction
*
*****************************************/

playerMovementDirection = inputRightKey - inputLeftKey;

if (playerMovementDirection != 0) 
{
	playerSpriteFacing = playerMovementDirection;
}

/*****************************************
*
* Set the player speed in x
*
*****************************************/

playerSpeedX = playerMovementDirection * playerMovementSpeed;

/*****************************************
*
* Handle player dashing
*
*****************************************/

if (
	abs(playerSpeedX) > 0 && 
	inputShiftKey && 
	playerOnGround && 
	playerDashCooldownTimer <= 0 && 
	playerIsSliding == false
) 
{
	playerIsDashing = true;
	playerDashCooldownTimer = playerDashCooldownTimerMax;
}

if (playerIsDashing) 
{
	playerDashTimer++;
	
	if (playerDashTimer < playerDashTimerMax) 
	{
		playerSpeedX = playerMovementDirection * playerDashSpeedMultiplier;
	} 
	else 
	{
		playerIsDashing = false;	
		playerDashTimer = 0;
	}
}
else 
{
	playerDashCooldownTimer--;	
}

if (!inputShiftKey && playerDashTimer > playerDashTimerMax)
{
	playerDashTimer = 0;
	playerIsDashing = false;
}

/*****************************************
*
* Handle the player sliding
*
*****************************************/

if (
	abs(playerSpeedX) > 0 && 
	inputSlideKey && 
	playerOnGround &&  
	playerSlideCooldownTimer <= 0 && 
	playerIsDashing == false
) 
{
	playerIsSliding = true;
	playerSlideCooldownTimer = playerSlideCooldownTimerMax;
}

if (playerIsSliding) 
{
	playerSlideTimer++;
	
	if (playerSlideTimer < playerSlideTimerMax) 
	{
		playerSpeedX = playerMovementDirection * playerSlideSpeedMultiplier;
	} 
	else 
	{
		playerIsSliding = false;	
		playerSlideTimer = 0;
	}
	
	// Check ahead with the maskIndex of running to see if the player will collide
	
}
else 
{
	playerSlideCooldownTimer--;
}

if (!inputSlideKey && playerSlideTimer > playerSlideTimerMax)
{
	playerSlideTimer = 0;
	playerIsSliding = false;
}

/*****************************************
*
* Ground collision in x
*
*****************************************/

if (place_meeting(x + playerSpeedX, y, oGround)) 
{
	
	if (snapToColliders) 
	{
		snapToColliderOnX(playerSpeedX, oGround);
	}
	
	playerSpeedX = 0;
}


/*****************************************
*
* Solid platform collision in x
*
*****************************************/

if (place_meeting(x + playerSpeedX, y, oSolidPlatform)) 
{
	if (snapToColliders) 
	{
		snapToColliderOnX(playerSpeedX, oSolidPlatform);
	}
	
	playerSpeedX = 0;
}


/*****************************************
*
* Assign gravity to the player
*
*****************************************/

if (playerIsDashing == false && playerIsSliding == false)
{
	playerSpeedY += gravitySpeed;
}

/*****************************************
*
* Player jumping and setup for dropping 
* through platforms
*
*****************************************/

if (playerOnGround) 
{
	playerJumps = 0;	
}

if (
	inputJumpKeyPressed && inputDownKey && 
	( 
		jumpThroughPlatformInstance != noone ||
		movingJumpThroughPlatformInstance != noone || 
		playerActivatedJumpThroughPlatformInstance != noone
	)
)
{
	activeJumpThroughPlatformInstance = jumpThroughPlatformInstance;
	activeMovingJumpThroughPlatformInstance = movingJumpThroughPlatformInstance;
	activePlayerActivatedJumpThroughPlatformInstance = playerActivatedJumpThroughPlatformInstance;
	
	setPlayerOnGround(false);
}

if (
	inputJumpKeyPressed > 0 && 
	playerJumps < playerMaxJumps && 
	!inputDownKey && 
	playerIsSliding == false && 
	playerIsDashing == false && 
	(
		playerIsJumping == false ||
		(playerIsJumping == true && playerJumps < playerMaxJumps)
	)
	
) 
{
	playerSpeedY = playerJumpForce;
	playerIsJumping = true;
	
	setPlayerOnGround(false, true);
}

if (playerSpeedY > gravityTerminalSpeed) {
	playerSpeedY = gravityTerminalSpeed;
}

/*****************************************
*
* Ground collision in y
*
*****************************************/

if (place_meeting(x, y + playerSpeedY, oGround))
{
	playerSpeedY = 0;	
	setPlayerOnGround(true);
}

/*****************************************
*
* Solid platform collision in y
*
*****************************************/

if (place_meeting(x, y + playerSpeedY, oSolidPlatform))
{
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}


/*****************************************
*
* Collision with jump through platforms
*
*****************************************/

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

if (jumpThroughPlatformInstance != noone) 
{
	if (snapToColliders) 
	{
		snapToColliderOnY(playerSpeedY, jumpThroughPlatformInstance);
	}
	
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
}

/*****************************************
*
* Collision with player activated jump through platforms
*
*****************************************/

if (instance_exists(playerActivatedJumpThroughPlatformInstance)) 
{
	playerActivatedJumpThroughPlatformInstance.sprite_index = playerActivatedJumpThroughPlatformInstance.spriteInitial;	
}


var resetNumberOfPlayerActivatedJumpThroughPlatforms = instance_number(oPlayerActivatedJumpThroughPlatform);

for (var i = 0; i < resetNumberOfPlayerActivatedJumpThroughPlatforms; i++) 
{
	var localPlayerActivatedJumpThroughPlatformInstance = instance_find(oPlayerActivatedJumpThroughPlatform, i);
	localPlayerActivatedJumpThroughPlatformInstance.sprite_index = localPlayerActivatedJumpThroughPlatformInstance.spriteInitial;	
}

playerActivatedJumpThroughPlatformInstance = noone;

var numberOfPlayerActivatedJumpThroughPlatforms = instance_number(oPlayerActivatedJumpThroughPlatform);

for (var i = 0; i < numberOfPlayerActivatedJumpThroughPlatforms; i++) 
{
	var localPlayerActivatedJumpThroughPlatformInstance = instance_find(oPlayerActivatedJumpThroughPlatform, i);
	
	if (
		place_meeting(x, y + playerSpeedY, localPlayerActivatedJumpThroughPlatformInstance) && 
		floor(y) <= localPlayerActivatedJumpThroughPlatformInstance.bbox_top && 
		activePlayerActivatedJumpThroughPlatformInstance != localPlayerActivatedJumpThroughPlatformInstance
	)
	{	
		playerActivatedJumpThroughPlatformInstance = localPlayerActivatedJumpThroughPlatformInstance;
		
		if (instance_exists(localPlayerActivatedJumpThroughPlatformInstance)) 
		{
			localPlayerActivatedJumpThroughPlatformInstance.sprite_index = localPlayerActivatedJumpThroughPlatformInstance.spriteActive;
		}
	}	
}

if (playerActivatedJumpThroughPlatformInstance != noone) 
{
	if (snapToColliders) 
	{
		snapToColliderOnY(playerSpeedY, playerActivatedJumpThroughPlatformInstance);
	}
	
	playerSpeedY = 0;
	
	setPlayerOnGround(true);
} 

/*****************************************
*
* Collision with moving jump through platforms
*
*****************************************/

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

if (movingJumpThroughPlatformInstance != noone) 
{	
	x += movingJumpThroughPlatformInstance.deltaX;
	y += movingJumpThroughPlatformInstance.deltaY;
	
	setPlayerOnGround(true);
	
	playerSpeedY = 0;
}

if (
	movingJumpThroughPlatformInstance != noone && 
	(
		place_meeting(x, y + playerSpeedY + movingJumpThroughPlatformInstance.deltaY, oGround) ||
		place_meeting(x, y + playerSpeedY + movingJumpThroughPlatformInstance.deltaY, oSolidPlatform)
	)
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
*
* Move the player
*
*****************************************/

x += playerSpeedX;
y += playerSpeedY;

/*****************************************
*
* Basic kill plane
*
*****************************************/

if (place_meeting(x, y, oKillPlane)) 
{	
	playerHealth = 0;
}

if (playerHealth <= 0) 
{
	room_restart();	
}

/*****************************************
*
* Basic enemy collision
*
*****************************************/

if (place_meeting(x, y, oEnemyPatrol)) 
{	
	playerIFramesCounter--;
	
	if (playerIFramesCounter > 0) 
	{
		exit;
	}
	
	playerHealth -= oEnemyPatrol.enemyDamage;
	playerIFramesCounter = playerIFrames;
}

/*****************************************
*
* Switch the sprite
*
*****************************************/

if (playerSpeedX == 0) 
{
	sprite_index = playerSpriteIdle;	
	mask_index = playerSpriteIdle;	
	image_speed = 1;
}

if (abs(playerSpeedX) > 0) 
{
	sprite_index = playerSpriteRun;
	mask_index = playerSpriteRun;
	image_speed = 1;
}

if (playerIsSliding) 
{
	sprite_index = playerSpriteSlide;
	mask_index = playerSpriteSlide;
	image_speed = 1;
}

if (playerIsDashing) 
{
	sprite_index = playerSpriteDash;
	mask_index = playerSpriteDash
	image_speed = 1;
}

if (playerSpeedY < 0 && playerOnGround != true) 
{
	sprite_index = playerSpriteJump;
	mask_index = playerSpriteJump;
	image_speed = 0;
	image_index = 0;
}

if (playerSpeedY > 0 && playerOnGround != true) 
{
	sprite_index = playerSpriteJump;
	mask_index = playerSpriteJump;
	image_speed = 0;
	image_index = 2;
}
