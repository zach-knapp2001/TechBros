/// @description Insert description here
// You can write your code in this editor

event_inherited();

maxSpeed = 2;

damage = 34;
toBeVisible = true;

attackAnim = instance_create_layer(Obj_bugA.x, Obj_bugA.y, "Enemies", Obj_bug_attack);
attackAnimID = attackAnim.id;
instance_destroy(attackAnim);

attackingObj = instance_create_layer(-100, -100, "Enemies", Obj_SolidTile);
//instance_destroy(attackingObj);