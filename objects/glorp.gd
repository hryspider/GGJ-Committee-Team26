extends CharacterBody2D

var speed = 200
#var animation = "idle":
	#set(value):
		#if value != animation:
			#animation = value
			#sprite.animation = value


@onready var sprite = $Sprite
@onready var eye = $Sprite/Eye
var eye_direction = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if direction:
		sprite.play("walk")
		sprite.flip_h = direction.x >= 0
	else:
		sprite.play("idle")
	point_eye_to_mouse()
	move_and_slide()

func point_eye_to_mouse():
	eye.offset = (eye.global_position - get_global_mouse_position()).normalized() * -2

func _on_sprite_animation_changed():
	eye.visible = sprite.animation == "idle"
	
