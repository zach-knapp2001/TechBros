/// @description Pulls up mini menu for this tile
// You can write your code in this editor

// Makes sure that tiles are interactable and there is not currently a tower on this spot
if (global.tilesInteractable && place_meeting(x, y, Obj_gTower1) = false) {
	
	// Makes all tileTops not interactable	
	global.tilesInteractable = false;
	
	// Creates mini menu and assigns the appropriate attributes
	towerCreator = instance_create_layer(x + 16, y - 32, "UI", Obj_gIcon1);
	towerCreator.tileTop = id;
	backButton = instance_create_layer(x + 16, y + 16, "UI", Obj_TileBack);
	backButton.tileTop = id;
}