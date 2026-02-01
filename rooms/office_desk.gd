extends Node2D

@onready var dialog_managers = [
	$DialogManager1,
	$DialogManager2,
	$DialogManager3,
	$DialogManager4,
	$DialogManager5,
	$DialogManager6,
	$DialogManager7,
	$DialogManager8
]

@onready var questioner_scene = preload("res://ui/questioner.tscn")

var current_quest = null

var questioner_words = [
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""]
]
var questioner_aliases = [
	[],
]
var current_step = 0

func run_step():
	await dialog_managers[current_step].start_dialog()
	current_quest = questioner_scene.instantiate()
	current_quest.word = questioner_words[current_step]
	current_quest.aliases = questioner_aliases[current_step]
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
