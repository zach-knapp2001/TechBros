/// @description spawn in enemy

instance_create_layer( Obj_SpawnTile.x, Obj_SpawnTile.y, "Instances_1", Obj_bugA);

path_change_point(test_path, 0, Obj_SpawnTile.x, Obj_SpawnTile.y, 100);