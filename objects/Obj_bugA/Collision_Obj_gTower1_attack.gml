/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

HP = HP - 1;

if (HP <= 0) {
	audio_play_sound(Enemy_Death,3,false)
	
	hudVar.enemies_killed++;
	hudVar.hud_money++;
	show_debug_message(hudVar.enemies_killed);
	instance_destroy();
}
