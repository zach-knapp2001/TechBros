/// @description On-click actions
// You can write your code in this editor


if (hudVar.hud_money >= 5)
{
	audio_play_sound(Tower_Placement,3,false)
	hudVar.hud_money = hudVar.hud_money - 5;
	// Creates a tower at the location of the corresponding tileType
	var newTower = instance_create_layer(tileTop.x, tileTop.y, "Towers", Obj_gTower1);
	tileTop.relatedTile.tileTower = newTower;

	// Makes tiles interactable once this button is pressed
	global.tilesInteractable = true;

	// Destroys the two buttons pertaining to the tile
	instance_destroy(Obj_TileBack);
	instance_destroy();
}
else
{
	_displayW =	display_get_width();
	_displayH =	display_get_height();
	
	draw_text(_displayW / 2, _displayH / 2, "Not enough money!");
	
	global.tilesInteractable = true;
	
	instance_destroy(Obj_TileBack);
	instance_destroy();
}