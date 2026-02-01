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

@onready var ending_dialogue = $DialogManager9

@onready var selecter_scene = preload("res://ui/talk_selector.tscn")

@onready var current_quest = null

var questioner_aliases = [
	["glorp", "i", "me"],
	["yes"],
	["bad", "no"],
	["house", "near"],
	["office"],
	["boss"],
	["no"],
	["yes"]
]
var current_step = 0
var wrong_answers = 0

func run_step():
	await dialog_managers[current_step].start_dialog()
	var t_selectp = selecter_scene.instantiate()
	$CanvasLayer.add_child(t_selectp)
	var t_select = t_selectp.get_children()[0]
	t_select.start()
	await t_select.done
	t_selectp.queue_free()
	var correct = questioner_aliases[current_step].has(LangaugeGlobals.gleep_to_english[t_select.return_var])
	if !correct: wrong_answers += 1
	$AnimatedSprite2D.play("pissed" if !correct else ["question","suspicious","talk","idle"][randi_range(0,3)])
	await get_tree().create_timer(1.5).timeout
	current_step += 1
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(8):
		await run_step()
		if i == 6:
			pass #DO THE WIFE ANIMATION
		if wrong_answers > 2:
			get_tree().change_scene_to_file("res://rooms/failure.tscn")
			return
	await ending_dialogue.start_dialog()
	get_tree().change_scene_to_file("res://rooms/23transition.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
