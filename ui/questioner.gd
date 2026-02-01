extends Control

@export var word = ""
@export var instructions = ""
@export var aliases = []
@onready var instructions_label = $Instructions
@onready var word_label = $Word

var active = false

signal satisfied

func _ready():
	hide()
	word_label.text = LangaugeGlobals.english_to_gleep[word]
	instructions_label.text = instructions
	
	
func activate():
	visible = true
	await get_tree().create_timer(1.0).timeout

func _process(delta: float):
	if active:
		if visible:
			get_tree().get_first_node_in_group("player").can_move = false
			if Input.is_action_just_pressed("click"):
				visible = false
				get_tree().get_first_node_in_group("player").can_move = true
		else:
			if aliases.has(LangaugeGlobals.player_dictionary[word]):
				emit_signal("satisfied")
				active = false
				
