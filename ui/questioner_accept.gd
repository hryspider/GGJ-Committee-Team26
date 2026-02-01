extends Control

@export var word = ""
@onready var gleepword
@export var instructions = ""
@export var aliases = []
@onready var instructions_label = $Main/VBoxContainer/Instructions
@onready var word_label = $Main/VBoxContainer/Word
@onready var timer_label = $Main/VBoxContainer/TimerText
@onready var minihint = $Minihint
@onready var timer = $Timer
@onready var main = $Main
var correct = false

var active = false

func _ready() -> void:
	pass
	
func activate():
	main.show()
	await get_tree().create_timer(1.0).timeout
	active = true

func run_question():
	gleepword = LangaugeGlobals.english_to_gleep[word]
	word_label.text = gleepword
	minihint.text = word_label.text
	instructions_label.text = instructions
	
	main.show()
	timer.start()
	await timer.timeout
	active = true
	await $Button.pressed
	if LangaugeGlobals.player_dictionary.has(gleepword):
		correct = aliases.has(LangaugeGlobals.player_dictionary[gleepword])
		queue_free()
		return
	correct = false
	queue_free()
	return
				

func _process(delta: float) -> void:
	timer_label.text = str(timer.time_left)
