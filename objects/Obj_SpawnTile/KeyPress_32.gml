/// @description spawn in enemy

newSpawn = instance_create_layer(Obj_SpawnTile.x, Obj_SpawnTile.y, "Enemies", Obj_bugA);
newSpawn.path = path;
//path_change_point(test_path, 0, Obj_SpawnTile.x, Obj_SpawnTile.y, 100);