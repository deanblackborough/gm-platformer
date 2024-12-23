
draw_sprite_ext(
	sprite_index, 
	image_index, 
	x, 
	y, 
	image_xscale * playerSpriteFacing, 
	image_yscale, 
	image_angle, 
	image_blend, 
	image_alpha
);


// Slide target
if (showDebug && playerOnGround) 
{
	if (playerSpriteFacing == 1) 
	{	
		draw_set_colour(c_lime);
		draw_line_width(x + (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 1, x + (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 32, 2);
		
		draw_set_colour(c_green);
		draw_line_width(x + (playerDashSpeedMultiplier * playerDashTimerMax), y - 1, x + (playerDashSpeedMultiplier * playerDashTimerMax), y - 32, 2);
	}
	else 
	{
		draw_set_colour(c_lime);
		draw_line_width(x - (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 1, x - (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 32, 2);	
		
		draw_set_colour(c_green);
		draw_line_width(x - (playerDashSpeedMultiplier * playerDashTimerMax), y - 1, x - (playerDashSpeedMultiplier * playerDashTimerMax), y - 32, 2);
	}
}