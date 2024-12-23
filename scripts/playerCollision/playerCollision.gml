
function snapToColliderOnX(_xSpeed, _colliderObject, _colliderSnap = 0.25)
{
	var snapToPlatform = _colliderSnap * sign(_xSpeed);
	while (!place_meeting(x + snapToPlatform, y, _colliderObject)) 
	{
		x += snapToPlatform;
	}
}

function snapToColliderOnY(_ySpeed, _colliderObject, _colliderSnap = 0.25)
{
	var snapToPlatform = _colliderSnap * sign(_ySpeed);
	while (!place_meeting(x, y + snapToPlatform, _colliderObject)) 
	{
		y += snapToPlatform;
	}
}

// @function	setPlayerOnGround(_state, _jump = false)
/// @description	Set the playr on ground and optionally increase jump count
/// @param {Bool} _state	The on ground state
/// @param {Bool} _jump	Should the jump count be increased?
///
function setPlayerOnGround(_state, _jump = false) 
{
	playerOnGround = _state;
	
	if (_state == true)
	{
		playerJumps = 0;
		playerIsJumping = false;
	}
	
	if (_state == false && _jump == true) 
	{
		playerJumps++;
		
		// Reset active platforms as player is no longer touching platforms
		activeJumpThroughPlatformInstance = noone;
		activeMovingJumpThroughPlatformInstance = noone;
		activePlayerActivatedJumpThroughPlatformInstance = noone;
	}
}