extends CanvasGroup

var can_close = false
var open = false
signal finished

@export var words_learned : Array[String]

func _ready():
	hide()
	modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if open:
		modulate.a += delta*3
		for i in words_learned:
			LangaugeGlobals.add_word_confirmed(i)
	else:
		modulate.a -= delta*3
	modulate.a = clampf(modulate.a, 0, 1)
	if Input.is_action_just_pressed("interact") and modulate.a >= 1 and open:
		emit_signal("finished")
		open = false
		can_close = false
		
		


func appear():
	can_close = false
	open = true
	show()
