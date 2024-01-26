/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 46154BBA
/// @DnDArgument : "obj" "Obj_controls"
/// @DnDSaveInfo : "obj" "Obj_controls"
var l46154BBA_0 = false;
l46154BBA_0 = instance_exists(Obj_controls);
if(l46154BBA_0)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 15EE7468
	/// @DnDApplyTo : obj_controls
	/// @DnDParent : 46154BBA
	with(obj_controls) instance_destroy();
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 7DBF126C
else
{
	/// @DnDAction : YoYo Games.Instances.Create_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 77CD9AC9
	/// @DnDParent : 7DBF126C
	/// @DnDArgument : "xpos" "room_width / 2"
	/// @DnDArgument : "ypos" "room_height - 100"
	/// @DnDArgument : "objectid" "Obj_controls"
	/// @DnDSaveInfo : "objectid" "Obj_controls"
	instance_create_layer(room_width / 2, room_height - 100, "Instances", Obj_controls);
}