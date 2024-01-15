/// @description Creates all the tiles on the hex grid
window_set_fullscreen(false);
// show_debug_log(true);

global.hex_step = [104, 11];
border = [32+global.hex_step[0]*3, 32+global.hex_step[1]*14];
global.board_size = [4,16];

var h_shift = 1;

for(var i = 0; i < 16; i++) {
	for (var j = 0; j < 4; j++) {
		var hex_x = -j*global.hex_step[0] + (h_shift)*(global.hex_step[0]/2) + border[0];
		var hex_y = -i*global.hex_step[1] + (global.hex_step[1]/2) + border[1];
		
		var new_tile = instance_create_layer(hex_x, hex_y, "Instances", Obj_DirtTile);
		new_tile.position = [i, j];
		new_tile.adj_tiles = find_adj_tiles(new_tile);
		
		// draw_sprite(DirtTile, 1, hex_x, hex_y);
	}
	h_shift = h_shift ? 0 : 1;
}
