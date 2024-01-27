/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(tileHP <= 50){
	sprite_index = dirt_tile_damaged;
}

if(tileHP <= 0){
	if (place_meeting(interactionTileTop.x, interactionTileTop.y-30, Obj_gTower1)) {
		instance_destroy(tileTower);
	}
	tileHP = 1;
	instance_change(Obj_EmptyTile, false);
	instance_create_layer(x, y, "Tiles", Obj_dirtTileDestroy);
}