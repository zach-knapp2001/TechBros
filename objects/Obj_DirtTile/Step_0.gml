/// @description Insert description here
// You can write your code in this editor

event_inherited();
/*
if (beingAttacked) {
	path_insert_point(test_path, path_get_number(test_path) - 1, other.x, other.y, 100);
	path_insert_point(test_path, path_get_number(test_path) - 1, x, y, 100);
	path_delete_point(test_path, 0);
	global.pathLen += 1;
	beingAttacked = false;
}
*/

if (place_meeting(x, y - 22, ParentEnemy)) {
	image_alpha = 0.7;
} else {
	image_alpha = 1;
}