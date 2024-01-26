if (room == GameplayScreen)
{
    audio_play_sound(Gameplay_Song, 1, true);
	layer_set_visible(layer_get_id("pause"),0);
	layer_set_visible(layer_get_id("pauseUI"),0);
	instance_deactivate_layer(layer_get_id("pauseUI"));
}