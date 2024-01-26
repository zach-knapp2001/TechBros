/// @description find enemy and shoot them
// You can write your code in this editor

if ((instance_exists(ParentEnemy)) && (distance_to_object(ParentEnemy) < attackRange)) {

	var furthest_enemy = instance_nearest(Obj_GoalTile.x, Obj_GoalTile.y, ParentEnemy);
	var bullet = instance_create_layer(x, y - 56, "Instances", Obj_gTower1_attack);
	
	audio_play_sound(Laser, 1, false);
	// aim and shoot at enemy closest to the end
	bullet.direction = point_direction(x, y - 56, furthest_enemy.x, furthest_enemy.y + 16);
	bullet.speed = 5;
}

alarm[0] = loopTime;
