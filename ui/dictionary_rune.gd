extends RigidBody2D


@onready var rune = $Rune
var unhoverable = false
var hovered = false
var being_edited = false
var text = ""

signal editing(pos)
signal edit_finished

func _ready():
	rune.put_text_overlay_below()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	angular_velocity += -rotation
	if Input.is_action_just_pressed("click"):
		if hovered and not unhoverable:
			being_edited = true
			rune.set_text_overlay("...")
			text = ""
			emit_signal("editing", position)
		elif being_edited:
			finish_edit()

func finish_edit():
	apply_random_spin()
	being_edited = false
	LangaugeGlobals.player_dictionary[rune.get_rune_text] = text
	rune.set_text_overlay(text)
	emit_signal("edit_finished")

func _input(event):
	if being_edited and event is InputEventKey and event.pressed:
		var input_char = OS.get_keycode_string(event.keycode)
		if input_char == "Backspace":
			text = text.left(-1)
		if text.length() < LangaugeGlobals.MAX_LENGTH and input_char.length() == 1:
			text = text + input_char.to_lower()
		rune.set_text_overlay(text)
		

func _on_area_2d_mouse_entered():
	if not unhoverable:
		hovered = true
		apply_random_spin()


func _on_area_2d_mouse_exited():
	hovered = false

func apply_random_spin():
	angular_velocity += randi_range(-3, 3)
