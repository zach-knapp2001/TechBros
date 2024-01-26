/// @description Insert description here
// You can write your code in this editor

newSpawn = instance_create_layer(Obj_SpawnTile.x, Obj_SpawnTile.y, "Enemies", Obj_bugA);
newSpawn.path = path;

alarm_set(0, 100);

