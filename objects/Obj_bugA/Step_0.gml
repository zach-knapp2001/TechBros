/// @description Insert description here
// You can write your code in this editor

if (!place_meeting(Obj_bugA.x, Obj_bugA.y, Obj_DirtTile))
{
    path_speed = 5
} else {
	instance_create_layer(Obj_bugA.x, Obj_bugA.y, "Instances_1", Obj_bug_attack);
}