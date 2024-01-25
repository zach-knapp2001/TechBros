/// @description Insert description here
// You can write your code in this editor




if (!instance_exists(attackAnimID))
{
    path_speed = 0;
	attackAnim = instance_create_layer(Obj_bugA.x, Obj_bugA.y + 2, "Instances_1", Obj_bug_attack);
	attackAnimID = attackAnim.id;
	attackingObj = other;
	other.beingAttacked = true;
	alarm_set(0,65);
}