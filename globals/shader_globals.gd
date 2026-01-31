extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	RenderingServer.global_shader_parameter_set("jitterrate", 5.)
	RenderingServer.global_shader_parameter_set("jitterscale", 25.)
	RenderingServer.global_shader_parameter_set("jitterstrength", 1.)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
