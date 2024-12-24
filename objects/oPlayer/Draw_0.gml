
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



if (showDebug) 
{
	if (playerOnGround) 
	{
		if (playerSpriteFacing == 1) 
		{	
			// Slide target
			draw_set_colour(c_lime);
			draw_line_width(x + (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 1, x + (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 32, 1);
		
			// Dash target
			draw_set_colour(c_green);
			draw_line_width(x + (playerDashSpeedMultiplier * playerDashTimerMax), y - 1, x + (playerDashSpeedMultiplier * playerDashTimerMax), y - 32, 1);
		}
		else 
		{
			// Slide target
			draw_set_colour(c_lime);
			draw_line_width(x - (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 1, x - (playerSlideSpeedMultiplier * playerSlideTimerMax), y - 32, 1);	
		
			// Dash target
			draw_set_colour(c_green);
			draw_line_width(x - (playerDashSpeedMultiplier * playerDashTimerMax), y - 1, x - (playerDashSpeedMultiplier * playerDashTimerMax), y - 32, 1);
		}
	}
	
	// Collison box
	draw_set_colour(c_lime);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}