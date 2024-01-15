/// @description Insert description here

var h_shift = 1;

for(var i = 0; i < 14; i++) {
	for (var j = 0; j < 4; j++) {
		var hex_x = j*hex_step[0] + (h_shift)*(hex_step[0]/2) + border[0];
		var hex_y = i*hex_step[1] + (hex_step[1]/2) + border[1];
		
		
		draw_sprite(DirtTile, 1, hex_x, hex_y);
	}
	h_shift = h_shift ? 0 : 1;
}