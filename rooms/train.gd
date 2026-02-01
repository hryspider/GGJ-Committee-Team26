extends Node2D

@onready var dialog_manager = $DialogManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialog_manager.start_dialog()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
