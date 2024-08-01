
playerMovementSpeed = 2;
playerMovementDirection = 1;

playerSpeedX = 0;
playerSpeedY = 0;

playerSprite = sPlayerIdle;
playerSpriteIdle = sPlayerIdle;
playerSpriteRun = sPlayerRun;
playerSpriteJump = sPlayerJump;
playerSpriteFacing = 1;

gravitySpeed = 0.3;
gravityTerminalSpeed = 6;

playerOnGround = false;

playerJumpForce = -5;
playerJumps = 0;
playerMaxJumps = 2;

// Jump through platforms
jumpThroughPlatformInstance = noone;
activeJumpThroughPlatformInstance = noone;

// Moving jump through platforms
movingJumpThroughPlatformInstance = noone;
activeMovingJumpThroughPlatformInstance = noone;

// Quality options
snapToColliders = false;

// Debugging
showDebug = false;