/// @description Creates all the tiles on the hex grid
window_set_fullscreen(false);
// show_debug_log(true);

randomize();

global.hex_step = [104, 11];
global.border = [32+global.hex_step[0]*3, 32+global.hex_step[1]*14];
global.board_size = [4,16];
global.tiles = [];
global.tilesInteractable = true;

var h_shift = 1;

for(var i = 0; i < 16; i++) {
	var tile_col = [];
	for (var j = 0; j < 4; j++) {
		// var hex_x = -j*global.hex_step[0] + (h_shift)*(global.hex_step[0]/2) + global.border[0];
		// var hex_y = -i*global.hex_step[1] + (global.hex_step[1]/2) + global.border[1];
		
		var coords = position_to_coords([j, i]);
		var new_tile = instance_create_layer(coords[0], coords[1], "Tiles", Obj_DirtTile);
		new_tile.position = [j, i];
		new_tile.adj_tiles = find_adj_tiles(new_tile);
		array_push(tile_col, new_tile);
		// draw_sprite(DirtTile, 1, hex_x, hex_y);
	}
	array_push(global.tiles, tile_col);
	h_shift = h_shift ? 0 : 1;
}


/// Spawn the goal tile
var possibleGoalTiles = [[1,7],[2,6],[2,8]];
var goalTilePosition = rand_choice(possibleGoalTiles);
// var choice = irandom(array_length(possibleGoalTiles) - 1);
// var goalTilePosition = possibleGoalTiles[choice];
global.goalTile = global.tiles[goalTilePosition[1]][goalTilePosition[0]];
global.goalTile.change_to = Obj_GoalTile;
global.goalTile.position = goalTilePosition;
global.goalTile.adj_tiles = find_adj_tiles(global.goalTile);




/// Random generation of hard tiles
var possibleHardTiles = [];
for (var i = 0; i < global.board_size[1] - 4; i = i+2) {
	for (var j = 0; j < global.board_size[0] - 1; j++) {
		array_push(possibleHardTiles, [j, i+3]);
		array_push(possibleHardTiles, [j+1, i+2]);
	}
}


//show_debug_message("Possible hard tiles before filtering: " + string(possibleHardTiles));
//show_debug_message("Goal tile position: " + string(global.goalTile.position));
//show_debug_message("index for goal tile: " + string(array_get_index(possibleHardTiles, global.goalTile.position)));

for (i = 0; i < array_length(possibleHardTiles); i++) {
	if (array_equals(possibleHardTiles[i], global.goalTile.position)) {
		array_delete(possibleHardTiles, i, 1);
	}
}
//array_delete(possibleHardTiles, array_get_index(possibleHardTiles, global.goalTile.position), 1);
for (i = 0; i < 6; i++) {
	for (j = 0; j < array_length(possibleHardTiles); j++) {
		if (array_equals(possibleHardTiles[j], global.goalTile.adj_tiles[i])) {
			array_delete(possibleHardTiles, j, 1);
		}
	}
	// array_delete(possibleHardTiles, array_get_index(possibleHardTiles, global.goalTile.adj_tiles[i]), 1);
}
//show_debug_message("Possible hard tiles after filtering: " + string(possibleHardTiles));


var hardTileList = [];
for (i = 0; i < 12; i++) {
	var hardTileChoice = rand_choice(possibleHardTiles);
	array_push(hardTileList, hardTileChoice);
	
	var newHardTile = global.tiles[hardTileChoice[1]][hardTileChoice[0]];
	newHardTile.tileHP = 9999999999;
	newHardTile.change_to = Obj_SolidTile;
	newHardTile.position = [hardTileChoice[0], hardTileChoice[1]];
	newHardTile.adj_tiles = find_adj_tiles(newHardTile)	;
	global.tiles[hardTileChoice[1]][hardTileChoice[0]] = newHardTile;
	
	array_delete(possibleHardTiles, array_get_index(possibleHardTiles, hardTileChoice), 1);
}




/// Spawn the first enemy spawn
var possibleEnemySpawns = [];
for(var i = 0; i < global.board_size[1]; i = i+2) {
	array_push(possibleEnemySpawns, [0, i]);
	array_push(possibleEnemySpawns, [global.board_size[0] - 1, 1+i]);
}
for(var i = 0; i < global.board_size[0]; i++) {
	array_push(possibleEnemySpawns, [i, 0]);
	array_push(possibleEnemySpawns, [i, 1]);
	array_push(possibleEnemySpawns, [i, global.board_size[1] - 2]);
	array_push(possibleEnemySpawns, [i, global.board_size[1] - 1]);
}
var firstEnemySpawn = rand_choice(possibleEnemySpawns);
//show_debug_message(firstEnemySpawn);
global.enemySpawns = [firstEnemySpawn];
var enemySpawnTile = global.tiles[global.enemySpawns[0][1]][global.enemySpawns[0][0]];
enemySpawnTile.change_to = Obj_SpawnTile;
enemySpawnTile.position = firstEnemySpawn;
enemySpawnTile.adj_tiles = find_adj_tiles(enemySpawnTile);
var pathCourse = nextMove(firstEnemySpawn);
enemySpawnTile.pathCourse = pathCourse;
show_debug_message("Done pathing, path course: " + string(pathCourse));
var path = path_add();
for (i = 0; i < array_length(pathCourse); i++) {
	path_add_point(path, global.tiles[pathCourse[i][1]][pathCourse[i][0]].x, global.tiles[pathCourse[i][1]][pathCourse[i][0]].y, 100);
	show_debug_message("Path point: " + string(global.tiles[pathCourse[i][1]][pathCourse[i][0]].x))
}
//path_delete_point(path, path_get_length(path) - 1)
enemySpawnTile.path = path;
show_debug_message("Done pathing: " + string(path));
//global.tiles[global.enemySpawns[0][1]][global.enemySpawns[0][0]] = enemySpawnTile;


//global.pathLen = path_get_number(test_path);


