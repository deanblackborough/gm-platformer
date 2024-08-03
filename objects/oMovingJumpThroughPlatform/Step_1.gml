
angle += angleDelta;

var targetX = x;
var targetY = y;

if (moveInX == true)
{
	targetX = xstart + cos(angle) * radius;
}

if (moveInY == true) 
{
	targetY = ystart + sin(angle) * radius;
}

xSpeed = targetX - x;
ySpeed = targetY - y;

x += xSpeed;
y += ySpeed;
