// global boolean to dictate whether player is moving or not
globalvar moving;
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed (vk_space );
var onTheGround = place_meeting( x, y + 1, wall_obj);

draw_text(10,10, string(char_obj.x - 16));
if ( xDirection != 0 )
{
	image_xscale = xDirection;	
	// set moving to true
	moving = true;
}

else
{
	// set moving to false
	moving = false;
}

xSpeed = xDirection * player_speed;
ySpeed += .7;

if ( onTheGround )
{	
	if ( xDirection != 0 )
	{
		sprite_index = panda_moving_spr;
	}
	else
	{
		sprite_index = panda_normal_spr;	
	}
	if ( jump )
	{
			audio_play_sound(jump_audio, 10, false);
			// Change this to affect jump height
			ySpeed = -6;	
	}
}
// Jumping animation:
// else{
// sprite_index = spr_akira_jumping_anim
// }

if ( place_meeting( x + xSpeed, y, wall_obj ))
{
	while( !place_meeting( x + sign(xSpeed), y, wall_obj))
	{
		x += sign(xSpeed);
	}
	xSpeed = 0;
}

x += xSpeed;

if ( place_meeting( x, y + ySpeed, wall_obj ))
{
	while( !place_meeting( x , y + sign(ySpeed), wall_obj))
	{
		y += sign(ySpeed);
	}
	
	ySpeed = 0;	
}
y += ySpeed;

if ( movementAllowed == false && moving == true )
	{
	show_debug_message("You Lose");
	audio_stop_all();
	audio_play_sound(gameOver, 10, false);
	
	room_goto(game_over_rm);
	
	}
	
if (char_obj.x - 16 >= 2500)
	{
	show_debug_message("You win");
	audio_stop_all();
	audio_play_sound(JaimeSong2, 10, true);
	room_goto(win_rm);
	
	
	}