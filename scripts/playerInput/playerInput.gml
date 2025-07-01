function getPlayerInput(_process = true) 
{
	if(keyboard_check(ord("R"))) {
		game_restart();
	}
	
	if (_process) 
	{
		inputRightKey = keyboard_check(ord("D")) + 
			keyboard_check(vk_right) +
			gamepad_button_check(0, gp_padr);
		
		inputRightKey = clamp(inputRightKey, 0, 1);
	
		inputLeftKey = keyboard_check(ord("A")) + 
			keyboard_check(vk_left) +
			gamepad_button_check(0, gp_padl);
		
		inputLeftKey = clamp(inputLeftKey, 0, 1);
	
		inputDownKey = keyboard_check(ord("S")) + 
			keyboard_check(vk_down) +
			gamepad_button_check(0, gp_padd);
		
		inputDownKey = clamp(inputDownKey, 0, 1);

		inputShiftKey = keyboard_check(vk_shift) +
			gamepad_button_check(0, gp_face2);
		
		inputShiftKey = clamp(inputShiftKey, 0, 1);
	
		inputSlideKey = keyboard_check(ord("C")) + 
			gamepad_button_check(0, gp_face3);
		
		inputSlideKey = clamp(inputSlideKey, 0, 1);
	
		inputJumpKeyPressed = keyboard_check_pressed(vk_space) + 
			gamepad_button_check_pressed(0, gp_face1);
		
		inputJumpKeyPressed = clamp(inputJumpKeyPressed, 0, 1);	
	}
}