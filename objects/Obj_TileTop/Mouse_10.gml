/// @description Highlights the tile when hovered over with the mouse

// Makes sure that tiles are interactable and there is no tower on this spot
if (global.tilesInteractable && place_meeting(x, y, Obj_gTower1) = false) {
	visible = true;
}