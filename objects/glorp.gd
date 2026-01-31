extends CharacterBody2D

var speed = 200
#var animation = "idle":
	#set(value):
		#if value != animation:
			#animation = value
			#sprite.animation = value

@onready var splat = $Splat
@onready var sprite = $Sprite
@onready var eye = $Sprite/Eye
@onready var mask_sprite = $"Mask Sprite"
@onready var arms = []
@onready var arm_scene = load("res://objects/glorparm.tscn")

var eye_direction = 0
var can_move = true
var masks = [false, false, false]
var current_emotion = -1:
	set(value):
		current_emotion = value
		if value == -1:
			mask_sprite.hide()
		else:
			mask_sprite.show()
			mask_sprite.frame = value


# Called when the node enters the scene tree for the first time.
func _ready():
	var arm_inst
	for i in range(3):
		arm_inst = arm_scene.instantiate()
		arm_inst.index = i
		mask_sprite.add_child(arm_inst)
		arms.append(arm_inst)


func _physics_process(delta):
	if can_move:
		var direction = Input.get_vector("left", "right", "up", "down")
		speed = 200 if current_emotion == -1 else 100
		velocity = direction * speed
		if direction and current_emotion == -1:
			sprite.play("walk")
			sprite.flip_h = direction.x >= 0
		else:
			sprite.play("idle")
		point_eye_to_mouse()
		move_and_slide()
	mask_behaviour()

func point_eye_to_mouse():
	eye.offset = (eye.global_position - get_global_mouse_position()).normalized() * -2

func mask_behaviour():
	var nothing_held = true
	var maskinput = ""
	for i in range(3):
		maskinput = "mask%s" % i
		if Input.is_action_pressed(maskinput):
			masks[i] = true
			nothing_held = false
		else:
			masks[i] = false
			if arms[i].visible:
				arms[i].disappear()
		if Input.is_action_just_pressed(maskinput):
			current_emotion = i
			arms[i].appear()
	if nothing_held:
		current_emotion = -1

func _on_sprite_animation_changed():
	eye.visible = sprite.animation == "idle"
	



func _on_sprite_frame_changed():
	if sprite.animation == "walk" and fmod(sprite.frame, 3) == 1: splat.play()
