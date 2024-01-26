/// @description Highlights the tile when hovered over with the mouse

// Makes sure that tiles are interactable and there is no tower on this spot
if (global.tilesInteractable && place_meeting(x, y, Obj_gTower1) = false) {
	visible = true;
}

if (global.tilesInteractable && place_meeting(x, y + 42, Obj_GoalTile) = true) {
	instance_destroy();
}

if (global.tilesInteractable && place_meeting(x, y + 42, Obj_SpawnTile) = true) {
	instance_destroy();
}

if (global.tilesInteractable && !(place_meeting(x, y + 42, Obj_DirtTile) || place_meeting(x, y + 42, Obj_SolidTile))) {
	instance_destroy();
}

