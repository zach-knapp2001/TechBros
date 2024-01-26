/// @description Insert description here
// You can write your code in this editor

if (tileHP <= 0)
{
	show_debug_message("Should Die");
	audio_stop_all();
	room_goto(GameOver);
}



