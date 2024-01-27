/// @description Insert description here
// You can write your code in this editor

if (tileHP <= 0)
{
	show_debug_message("Should Die");
	audio_stop_all();
	room_restart();
	hudVar.enemies_killed = 0;
	hudVar.hud_money = 10;
	room_goto(GameOver);
}



