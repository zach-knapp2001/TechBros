/// @description Insert description here
// You can write your code in this editor

if(instance_exists(objBtn_controls))
{
	instance_destroy(objBtn_controls);
}

else
{
	instance_create_layer(room_width / 2, room_height - 150, "Instances", objBtn_controls);
}