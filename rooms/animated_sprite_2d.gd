extends AnimatedSprite2D

var suspicion = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !get_node("../Glorp").is_emotion_valid():
		suspicion += 0.5
		suspicion = min(suspicion, 100)
	else:
		suspicion -= 0.1
		suspicion = max(suspicion, 0)
	
	if suspicion >= 100:
		get_tree().change_scene_to_file("res://rooms/failure.tscn")
	elif suspicion > 80:
		play("upset")
	elif suspicion > 50:
		play("confused")
	else:
		play("talk")
