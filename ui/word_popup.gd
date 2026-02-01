extends Node2D


@onready var word = $Word
@onready var animation_player = $AnimationPlayer



func unlock(gleep):
	word.text = gleep
	animation_player.stop()
	animation_player.play("popup")
