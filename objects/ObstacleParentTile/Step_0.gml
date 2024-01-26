/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(tileHP <= 5){
	sprite_index = dirt_tile_damaged;
}

if(tileHP <= 0){
	instance_destroy();
	instance_create_layer(x, y, "Tiles", Obj_dirtTileDestroy);
}