// Variables for object

// enemySpeedX = float
// moveInXAmount = int
// startDelayMax = int (Movement will start on random frame between 0 and startDelayMax)
// enemyDamage = int
// showDebug = boolean (Show movement limits)

enemyMovementSpeed = 1;
enemyMovementDirection = 1;

if (startDelayMax > 0) 
{
	step = 0;	
	beginStep = random_range(0, startDelayMax);
	move = false;
}
else 
{
	move = true;	
}

enemySpeedY = 0;

deltaX = 0;
targetX = xstart + moveInXAmount;
incrementX = true;

enemySprite = sEnemyPatrolIdle;
enemySpriteIdle = sEnemyPatrolIdle;
enemySpriteRun = sEnemyPatrolIdle;
enemySpriteFacing = 1;

gravitySpeed = 0.3;
gravityTerminalSpeed = 6;

// Quality options
snapToColliders = true;
