extends Control

@export var word = ""
@onready var gleepword
@export var instructions = ""
@export var aliases = []
@onready var instructions_label = $Main/VBoxContainer/Instructions
@onready var word_label = $Main/VBoxContainer/Word
@onready var minihint = $Minihint
@onready var main = $Main

var active = false

signal satisfied

func _ready():
	minihint.hide()
	main.hide()
	gleepword = LangaugeGlobals.english_to_gleep[word]
	word_label.text = gleepword
	minihint.text = word_label.text
	instructions_label.text = instructions
	
	
	
func activate():
	main.show()
	await get_tree().create_timer(1.0).timeout
	active = true

func _process(delta: float):
	if active:
		if main.visible:
			get_tree().get_first_node_in_group("player").can_move = false
			if Input.is_action_just_pressed("click"):
				main.visible = false
				minihint.visible = true
				get_tree().get_first_node_in_group("player").can_move = true
		else:
			if LangaugeGlobals.player_dictionary.has(gleepword):
				if aliases.has(LangaugeGlobals.player_dictionary[gleepword]):
					emit_signal("satisfied")
					active = false
					hide()
				
