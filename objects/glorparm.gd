extends Sprite2D


var index := 0
var timer = 0

func _ready():
	hide()
	frame_coords.y = index

func _process(delta):
	if visible:
		timer += delta*5
		if timer > 0.5: frame_coords.x = 1
		offset = Vector2(sin(timer),cos(timer))

func appear():
	show()
	timer = 0
	frame_coords.x = 0
