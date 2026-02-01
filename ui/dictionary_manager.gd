extends Node

@onready var dict_scene = preload("res://ui/dictionary.tscn")
@onready var dict_instance = null

func _process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	if Input.is_action_just_pressed("dictionary"):
		if dict_instance == null:
			if player.can_move:
				dict_instance = dict_scene.instantiate()
				get_parent().add_child(dict_instance)
				player.can_move = false
		else:
			dict_instance.queue_free()
			player.can_move = true
			
		
