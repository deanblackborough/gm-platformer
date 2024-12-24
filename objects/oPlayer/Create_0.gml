// Variables for object

// showDebug = boolean (Show movement limits, slide target / dash target etc)
// playerHealth = integer
// playerMaxHealth = integer
// playerIFrames = integer

playerMovementSpeed = 2;
playerMovementDirection = 1;

// Action timers
playerActionTimer = 0;
playerActionTimerMax = 12;

// Player Dashing
playerIsDashing = false;
playerDashTimer = 0;
playerDashTimerMax = 12;
playerDashSpeedMultiplier = 12;
playerDashCooldownTimer = 0;
playerDashCooldownTimerMax = 120;

// Player sliding
playerIsSliding = false;
playerSlideTimer = 0;
playerSlideTimerMax = 12;
playerSlideSpeedMultiplier = 8;
playerSlideCooldownTimer = 0;
playerSlideCooldownTimerMax = 60;

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

playerIsJumping = false;
playerJumpForce = -5;
playerJumps = 0;
playerMaxJumps = 2;

// Damage and iFrames
playerIFramesCounter = 0;

// Jump through platforms
jumpThroughPlatformInstance = noone;
activeJumpThroughPlatformInstance = noone;

// Moving jump through platforms
movingJumpThroughPlatformInstance = noone;
activeMovingJumpThroughPlatformInstance = noone;

// Player activated jump through platform
playerActivatedJumpThroughPlatformInstance = noone;
activePlayerActivatedJumpThroughPlatformInstance = noone;

// Quality options
snapToColliders = true;
