extends RigidBody2D


@onready var rune = $Rune
var hovered = false

signal blast_away(pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	angular_velocity = -rotation
	if Input.is_action_just_pressed("down"):
		apply_central_force(Vector2(randi_range(-100,100), randi_range(-100,100))*1000)
	if Input.is_action_just_pressed("click") and hovered:
		rune.set_text_overlay("...")
		emit_signal("blast_away", position)
		print("gog")

func _on_area_2d_mouse_entered():
	hovered = true


func _on_area_2d_mouse_exited():
	hovered = false
