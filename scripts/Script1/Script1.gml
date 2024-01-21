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
		 	adj_tiles[i] = pointer_null;
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

// hello!!!!!!!!