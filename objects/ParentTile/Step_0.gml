/// @description Insert description here
// You can write your code in this editor

if(change_to != event_object) {
	instance_change(change_to, recreate);
	change_to = event_object;
}



if (damageTaken != 0) {
	tileHP-= damageTaken;
	damageTaken = 0;
}