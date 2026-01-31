extends Node

@export var intensity := 0.0
@onready var base_pos

func _ready():
	base_pos = get_parent().position

func _process(delta):
	get_parent().position = base_pos + Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))*intensity
