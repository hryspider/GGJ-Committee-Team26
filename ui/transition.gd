extends Node2D
@export var destination : PackedScene

func transition(body=null):
	if body == null or body.is_in_group("player"):
		get_tree().change_scene_to_packed(destination)
