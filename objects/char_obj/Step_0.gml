// global boolean to dictate whether player is moving or not
globalvar moving;
var xDirection = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var jump = keyboard_check_pressed (vk_space );
var onTheGround = place_meeting( x, y + 1, wall_obj);

if ( xDirection != 0 )
{
	image_xscale = xDirection;	
	// set moving to true
	moving = true;
	show_debug_message("moving");
}

else
{
	// set moving to false
	moving = false;
	show_debug_message("stopped");
}

xSpeed = xDirection * player_speed;
ySpeed += .6;

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