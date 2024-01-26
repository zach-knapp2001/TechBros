/// @description Insert description here
// You can write your code in this editor

gpu_set_blendenable(false);

if (pause)
{
	surface_set_target(appStill);
		if (surface_exists(pauseSurf)) draw_surface(pauseSurf, 0,0);
		else
		{
			pauseSurf = surface_create(resX, resY);
			buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
		}
	surface_reset_target();
	
	layer_set_visible(layer_get_id("pause"),1);
	layer_set_visible(layer_get_id("pauseUI"),1);
}

if (keyboard_check_pressed(vk_escape) and (room = GameplayScreen))
{
	if (!pause)
	{
		show_debug_message("pause enabled")
		
		pause = true;		
		instance_deactivate_all(true);
		instance_activate_layer(layer_get_id("pauseUI"));
		
		pauseSurf = surface_create(resX, resY);
		surface_set_target(pauseSurf);
			draw_surface(application_surface, 0,0);
		surface_reset_target();
		
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
		pauseSurfBuffer = buffer_create(resX * resY * 2, buffer_fixed, 1);
		buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
	}
	else
	{
		show_debug_message("pause disabled")
		layer_set_visible(layer_get_id("pause"),0);
		layer_set_visible(layer_get_id("pauseUI"),0);
		
		pause = false;
		instance_activate_all();
		instance_deactivate_layer(layer_get_id("pauseUI"));
		
		if (surface_exists(pauseSurf)) surface_free(pauseSurf);
		if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
	}
}

gpu_set_blendenable(true);