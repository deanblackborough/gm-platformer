
function snapToColliderOnX(playerObject, xSpeed, colliderObject, colliderSnap = 0.5)
{
	var snapToPlatform = colliderSnap * sign(xSpeed);
	while (!place_meeting(playerObject.x + snapToPlatform, playerObject.y, colliderObject)) 
	{
		playerObject.x += snapToPlatform;
	}
}