/// @description Insert description here
// You can write your code in this editor

tileHP = tileHP - 10
if(tileHP <= 0){
	instance_destroy();
}

path_change_point(test_path, path_get_number(test_path), Obj_DirtTile.x, Obj_DirtTile.y, 100);
path_insert_point(test_path, path_get_number(test_path) + 1, Obj_SpawnTile.x, Obj_SpawnTile.y, 100);
