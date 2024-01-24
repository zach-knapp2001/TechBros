/// @description Creates all the tiles on the hex grid
window_set_fullscreen(false);
// show_debug_log(true);

randomize();

global.hex_step = [104, 11];
global.border = [32+global.hex_step[0]*3, 32+global.hex_step[1]*14];
global.board_size = [4,16];
global.tiles = [];

var h_shift = 1;

for(var i = 0; i < 16; i++) {
	var tile_col = [];
	for (var j = 0; j < 4; j++) {
		// var hex_x = -j*global.hex_step[0] + (h_shift)*(global.hex_step[0]/2) + global.border[0];
		// var hex_y = -i*global.hex_step[1] + (global.hex_step[1]/2) + global.border[1];
		
		var coords = position_to_coords([j, i]);
		var new_tile = instance_create_layer(coords[0], coords[1], "Instances", Obj_DirtTile);
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
var goalTile = global.tiles[goalTilePosition[1]][goalTilePosition[0]];
goalTile.change_to = Obj_GoalTile;
// goalTile.position = goalTilePosition;
// goalTile.adj_tiles = find_adj_tiles(goalTile);



/// Spawn the first enemy spawn
var possibleEnemySpawns = [];
for(var i = 0; i < 16; i = i+2) {
	array_push(possibleEnemySpawns, [0, i]);
	array_push(possibleEnemySpawns, [3, 1+i]);
}
for(var i = 0; i < 4; i++) {
	array_push(possibleEnemySpawns, [i, 0]);
	array_push(possibleEnemySpawns, [i, 1]);
	array_push(possibleEnemySpawns, [i, 14]);
	array_push(possibleEnemySpawns, [i, 15]);
}
var firstEnemySpawn = rand_choice(possibleEnemySpawns);
global.enemySpawns = [firstEnemySpawn];
var enemySpawnTile = global.tiles[global.enemySpawns[0][1]][global.enemySpawns[0][0]];
enemySpawnTile.change_to = Obj_SpawnTile;
// enemySpawnTile.position = firstEnemySpawn;
// enemySpawnTile.adj_tiles = find_adj_tiles(enemySpawnTile);

