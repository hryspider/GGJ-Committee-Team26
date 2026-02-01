extends Node

@export var data : Array[DialogLine]
@onready var curr_line = 0
var speech_bubble = preload("res://objects/speech_bubble.tscn")
signal finished

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start_dialog():
	while curr_line < len(data):
		var new_bubble = speech_bubble.instantiate()
		var this_dialog = data[curr_line]
		get_parent().add_child(new_bubble)
		new_bubble.set_text(this_dialog.content)
		var target
		for path in this_dialog.animations.keys():
			target = get_node(path)
			print(target, path)
			#if not target is AnimatedSprite2D:
				#if target.has_node("/AnimatedSprite2D"):
					#target = target.get_node("/AnimatedSprite2D")
			target.play(this_dialog.animations[path])
		
		var speaker_position = get_node(this_dialog.speaker).global_position
		speaker_position.x = clampf(speaker_position.x, 0., 480. - new_bubble.size.x)
		speaker_position.y = clampf(speaker_position.y, 0., 270. - new_bubble.size.y)
		new_bubble.position = speaker_position
		new_bubble.destroy_timer.wait_time = this_dialog.duration
		new_bubble.play()
		await new_bubble.destroy_timer.timeout
		curr_line += 1
	emit_signal("finished")
	curr_line = 0
	
