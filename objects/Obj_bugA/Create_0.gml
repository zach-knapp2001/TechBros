/// @description Insert description here
// You can write your code in this editor

event_inherited();

maxSpeed = 1;

damage = 34;
toBeVisible = true;

audio_play_sound(Enemy_Spawn,2,false)

attackAnim = instance_create_layer(Obj_bugA.x, Obj_bugA.y, "Enemies", Obj_bug_attack);
attackAnimID = attackAnim.id;
instance_destroy(attackAnim);

attackingObj = instance_create_layer(-100, -100, "Enemies", Obj_SolidTile);
//instance_destroy(attackingObj);

alarm_set(2, 40);