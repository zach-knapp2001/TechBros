/// @DnDAction : YoYo Games.Instances.Create_Instance
/// @DnDVersion : 1
/// @DnDHash : 70FE33DD
/// @DnDArgument : "xpos_relative" "1"
/// @DnDArgument : "ypos_relative" "1"
/// @DnDArgument : "objectid" "tile_select"
/// @DnDSaveInfo : "objectid" "tile_select"
instance_create_layer(x + 0, y + 0, "Instances", tile_select);

/// @DnDAction : YoYo Games.Instances.Set_Sprite
/// @DnDVersion : 1
/// @DnDHash : 45946517
/// @DnDArgument : "spriteind" "tile_top"
/// @DnDSaveInfo : "spriteind" "tile_top"
sprite_index = tile_top;
image_index = 0;