extends Control

var item_scene = preload("res://objects/rune_button.tscn")
@onready var grid_container = $GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start():
	var mentioned = LangaugeGlobals.mentioned_words

	for item in mentioned:
		var new_node = item_scene.instantiate()
		new_node.runetext = item
		grid_container.add_child(new_node)
	
	pass
