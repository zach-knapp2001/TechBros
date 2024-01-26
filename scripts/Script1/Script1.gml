// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/// Finds position of tiles adjacent to a tile at the given position
// @var tile is the position of the tile that we need the adjacent tiles for
function find_adj_tiles(tile){
	var position = tile.position;
	var adj_tiles = array_create(6);
	
	var up = [position[0], position[1]+2];	
	var down = [position[0], position[1]-2];
	var up_right = array_create(2);
	var down_right = array_create(2);
	var up_left = array_create(2);
	var down_left = array_create(2);
	
	if(position[1] % 2 == 1) {
		// Test for adjacency on odd tiles
		up_right = [position[0], position[1]+1];
		down_right = [position[0], position[1]-1];
		down_left = [position[0]+1, position[1]-1];
		up_left = [position[0]+1, position[1]+1];
	} else {
		// Test for adjacency on even tiles
		up_left = [position[0], position[1]+1];
		down_left = [position[0], position[1]-1];
		down_right = [position[0]-1, position[1]-1];
		up_right = [position[0]-1, position[1]+1];
	}
	
	adj_tiles = [up, up_right, down_right, down, down_left, up_left];
	for(i = 0; i < 6; i++) {
		curr_adj_tile = adj_tiles[i];
		// show_debug_message(string(curr_adj_tile));
		if (curr_adj_tile[0] < 0 || curr_adj_tile[1] < 0 || curr_adj_tile[1] > global.board_size[1] - 1 || curr_adj_tile[0] > global.board_size[0] - 1) {
		 	adj_tiles[i] = -1;
		}
	}
	// show_debug_message(string(adj_tiles));
	return adj_tiles;
}


/// Translates array position from the hex grid to valid pixel coordinates
// @var position is the position on the map in [x,y] form
function position_to_coords(position) {
	var h_shift = (position[1] % 2 == 0) ? 1 : 0;
	var hex_x = -position[0]*global.hex_step[0] + (h_shift)*(global.hex_step[0]/2) + global.border[0];
	var hex_y = -position[1]*global.hex_step[1] + (global.hex_step[1]/2) + global.border[1];

	var coords = [hex_x, hex_y];
	return coords;
}
	
	
/// Chooses a random tile position from the given values
// @var positions are the possible positions 
function rand_choice(positions) {
	var choice = irandom(array_length(positions) - 1)
	return positions[choice];
}

/// Chooses a random index of the array positions
function rand_index(positions) {
	var choice = irandom(array_length(positions) - 1)
	return choice;
}


// hello!!!!!!!!
// my second comment

/// Chooses the next move for an enemy to make based on its position in the grid (Djikstra's Algorithm)
// @param position is the position of the enemy on the grid
// @returns a full path on the grid to the goal
function nextMove(position) {
	var move = [];
	// show_debug_message(array_contains(find_adj_tiles(global.tiles[position[1]][position[0]]), global.goalTile));
	// if (!array_contains(find_adj_tiles(global.tiles[position[1]][position[0]]), global.goalTile)) {
		var prioQueue = ds_priority_create();
		ds_priority_add(prioQueue, [position], 1);
		var pathList = [];
		var visitedList = [];
		
		//show_debug_message(pathList[array_length(pathList)-1] == []);
		//show_debug_message(array_length(pathList));

		while (ds_priority_find_min(prioQueue) != undefined) {
			var currPath = ds_priority_find_min(prioQueue)
			//show_debug_message(currPath);
			var currTile = currPath[array_length(currPath)-1];
			//show_debug_message("Current tile:" + string(currTile));
			var currPrio = ds_priority_find_priority(prioQueue, currPath);
			//show_debug_message(currPrio);
			ds_priority_delete_min(prioQueue);
			
			var visited = false;
			if (array_length(visitedList) > 0) {
				for (j = 0; j < array_length(visitedList); j++) {
					var iter = visitedList[j];
					//show_debug_message("iteration of visited: " + string(iter));
					visited = array_equals(iter, currTile) ? true : visited;
				}
				//show_debug_message("Visited bool: " + string(visited));
			}
			
			if (visited) {
				continue;
			}
			
			array_push(pathList, currPath);
			array_push(visitedList, currTile);
			
			if (array_equals(currTile, global.goalTile.position)) {
				move = currPath;
				// return move;
			}

			var adjTiles = find_adj_tiles(global.tiles[currTile[1]][currTile[0]]);
			//show_debug_message("Adjacent Tiles: " + string(adjTiles));
			for (i = 0; i < 6; i++) {
				var targetTile = adjTiles[i];
				//show_debug_message("Target tile: " + string(targetTile));
				//show_debug_message("visited list: " + string(visitedList));
				
				/*
				var visited = false;
				for (j = 0; j < array_length(visitedList); j++) {
					visited = array_equals(visitedList[j], targetTile) ? true : visited;
				}
				show_debug_message("Visited bool: " + string(visited));
				*/
				
				if (targetTile != -1) {
					var visited = false;
					for (j = 0; j < array_length(visitedList); j++) {
						visited = array_equals(visitedList[j], targetTile) ? true : visited;
					}
					//show_debug_message("Visited bool: " + string(visited));
				
					if (!visited) {
						var addedPath = array_concat(currPath, [targetTile]);
						ds_priority_add(prioQueue, addedPath, currPrio + global.tiles[targetTile[1]][targetTile[0]].tileHP + 10);
						
					}
				}
				//show_debug_message(ds_priority_size(prioQueue));
			}
		}
	// }
	return move;
}