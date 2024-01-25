/// @description Insert description here
// You can write your code in this editor

if (instance_exists(ParentEnemy)) {
	instance_create_layer(Obj_gTower1.x, Obj_gTower1.y, "Instances", Obj_gTower1);
}
alarm[0] = loopTime;
