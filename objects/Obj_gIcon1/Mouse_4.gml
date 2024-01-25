/// @description On-click actions
// You can write your code in this editor

// Creates a tower at the location of the corresponding tileType
instance_create_layer(tileTop.x, tileTop.y, "Towers", Obj_gTower1);

// Makes tiles interactable once this button is pressed
global.tilesInteractable = true;

// Destroys the two buttons pertaining to the tile
instance_destroy(Obj_TileBack);
instance_destroy();