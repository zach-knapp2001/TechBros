/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

HP = HP - 1;

if (HP <= 0) {
	instance_destroy();
}
