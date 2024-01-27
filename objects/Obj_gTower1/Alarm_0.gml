/// @description find enemy and shoot them
// You can write your code in this editor

var targeting = ds_priority_create();

for (var i = 0; i < instance_number(ParentEnemy); i++) {
	var potentialTarget = instance_find(ParentEnemy, i);
	var distFromGoal = point_distance(global.goalTile.x, global.goalTile.y, potentialTarget.x, potentialTarget.y);
	
	ds_priority_add(targeting, potentialTarget, distFromGoal);
}
	
var targetFound = false;
while (!targetFound  && ds_priority_size(targeting) > 0) {
	var targetTest = ds_priority_delete_min(targeting);
	if (distance_to_object(targetTest) < attackRange) {
		
		var target = targetTest;
		targetFound = true;

		//var furthest_enemy = instance_nearest(global.goalTile.x, global.goalTile.y, ParentEnemy);
		var bullet = instance_create_layer(x, y - 56, "Instances", Obj_gTower1_attack);
	
		// aim and shoot at enemy closest to the end
		audio_play_sound(Laser, 1, false);
		bullet.direction = point_direction(x, y - 56, target.x, target.y + 16);
		bullet.speed = 7;
	}
}




alarm[0] = loopTime;
