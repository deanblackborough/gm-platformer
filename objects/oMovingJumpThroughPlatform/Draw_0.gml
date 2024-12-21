draw_sprite_ext(
	sprite_index, 
	image_index, 
	x, 
	y, 
	image_xscale, 
	image_yscale, 
	image_angle, 
	image_blend, 
	image_alpha
);

if (showDebug && moveInX)
{	
	draw_set_colour(c_lime);
	draw_line_width(xstart, ystart - 1, xstart ,ystart + 15, 2);
	draw_line_width(xstart + moveInXAmount + (bbox_right - bbox_left), ystart - 1, xstart + moveInXAmount + (bbox_right - bbox_left), ystart + 15, 2);
}

if (showDebug && moveInY)
{	
	draw_set_colour(c_lime);
	draw_line_width(xstart, ystart, xstart + (bbox_right - bbox_left), ystart, 2);
	draw_line_width(xstart, ystart + moveInYAmount + (bbox_bottom - bbox_top), xstart + (bbox_right - bbox_left), ystart + moveInYAmount + (bbox_bottom - bbox_top), 2);
}