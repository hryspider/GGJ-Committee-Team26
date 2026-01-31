extends Node2D

@onready var interactbubble = $Interactbubble
@onready var animated_sprite_2d = $AnimatedSprite2D
@export var spriteframes : SpriteFrames

signal talk

var talking = false:
	set(value):
		interactbubble.visible = false
		talking = value
		animated_sprite_2d.play("talk" if value else "idle")

func _ready():
	if spriteframes:
		animated_sprite_2d.sprite_frames = spriteframes
	animated_sprite_2d.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interactbubble.visible && Input.is_action_just_pressed("interact"):
		get_tree().get_first_node_in_group("player").can_move = false
		talking = true
		emit_signal("talk")


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"): interactbubble.show()


func _on_area_2d_body_exited(body):
	if body.is_in_group("player"): interactbubble.hide()

func finished_dialog():
	talking = false
