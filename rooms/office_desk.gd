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
@onready var questioners = [
	$QuestionerCanvas
]
var questioner_words = [
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
	LangaugeGlobals.english_to_gleep[""],
]
var questioner_aliases = [
	[],
]
var current_step = 0

func run_step():
	await dialog_managers[current_step].start_dialog()
	var this_quest = questioners[current_step]
	var this_data = questioner_data[current_step]
	this_quest.word = questioners[current_step]
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
