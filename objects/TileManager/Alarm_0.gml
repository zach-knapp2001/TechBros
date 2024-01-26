/// @description Spawns a spawn tile

var newSpawnIndex = rand_index(possibleEnemySpawns);
var newEnemySpawn = possibleEnemySpawns[newSpawnIndex];
//show_debug_message(firstEnemySpawn);
array_push(global.enemySpawns, newEnemySpawn);
array_delete(possibleEnemySpawns, newSpawnIndex, 1);
var enemySpawnTile = global.tiles[global.enemySpawns[array_length(global.enemySpawns) - 1][1]][global.enemySpawns[array_length(global.enemySpawns) - 1][0]];
enemySpawnTile.change_to = Obj_SpawnTile;
enemySpawnTile.position = newEnemySpawn;
enemySpawnTile.adj_tiles = find_adj_tiles(enemySpawnTile);
var pathCourse = nextMove(newEnemySpawn);
enemySpawnTile.pathCourse = pathCourse;
// show_debug_message("Done pathing, path course: " + string(pathCourse));
var path = path_add();
for (i = 0; i < array_length(pathCourse); i++) {
	path_add_point(path, global.tiles[pathCourse[i][1]][pathCourse[i][0]].x, global.tiles[pathCourse[i][1]][pathCourse[i][0]].y, 100);
	show_debug_message("Path point: " + string(global.tiles[pathCourse[i][1]][pathCourse[i][0]].x))
}
//path_delete_point(path, path_get_length(path) - 1)
enemySpawnTile.path = path;
enemySpawnTile.startSpawning = true;
//show_debug_message("Done pathing: " + string(path));

if (array_length(possibleEnemySpawns) > 0) {
	alarm_set(0, 600);
}