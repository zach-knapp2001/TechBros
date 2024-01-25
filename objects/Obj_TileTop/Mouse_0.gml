/// @description Insert description here
// You can write your code in this editor

if (place_meeting(Obj_TileTop.x, Obj_TileTop.y, Obj_gTower1) = false) {
	instance_create_layer(Obj_TileTop.x + 16, Obj_TileTop.y - 32, "UI", Obj_gIcon1);
	instance_create_layer(Obj_TileTop.x + 16, Obj_TileTop.y + 16, "UI", Obj_TileBack);
}