draw_sprite_ext(
	sprite_index, 
	image_index, 
	x, 
	y, 
	image_xscale * enemySpriteFacing, 
	image_yscale, 
	image_angle, 
	image_blend, 
	image_alpha
);

if (showDebug)
{	
	draw_set_colour(c_lime);
	draw_line_width(xstart - 12, ystart - 1, xstart - 12, ystart - 32, 2);
	draw_line_width(xstart + moveInXAmount + 12, ystart - 1, xstart + moveInXAmount + 12, ystart - 32, 2);
}