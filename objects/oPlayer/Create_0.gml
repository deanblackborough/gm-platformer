
playerMovementSpeed = 2;
playerMovementSpeedSlide = 6;
playerMovementSpeedDash = 10;

playerMovementDirection = 1;

playerIsDashing = false;
playerDashTimer = 0;
playerDashTimerMax = 12;

playerIsSliding = false;
playerSlideTimer = 0;
playerSlideTimerMax = 12;

playerSpeedX = 0;
playerSpeedY = 0;

playerSprite = sPlayerIdle;
playerSpriteIdle = sPlayerIdle;
playerSpriteRun = sPlayerRun;
playerSpriteDash = sPlayerDash;
playerSpriteSlide = sPlayerSlide;
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
snapToColliders = true;

// Debugging
showDebug = false;