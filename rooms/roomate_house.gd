extends Node2D
@onready var questioner = $CanvasLayer/Questioner
@onready var questioner2 = $CanvasLayer/Questioner2
@onready var final_npc = $FinalNPC


var flags = [false, false, false]
var stage = 0


func check_flags():
	if flags == [true, true, true] and stage == 0:
		questioner.activate()
		get_tree().get_first_node_in_group("player").can_move = false
		stage = 1

func _on_dialog_manager_finished():
	flags[0] = true
	check_flags()


func _on_milk_overlay_finished():
	flags[1] = true
	check_flags()


func _on_money_overlay_finished():
	flags[2] = true
	check_flags()


		


func _on_questioner_satisfied():
	stage = 2
	print("yeah")
	$DictionaryManager.force_close = true
	questioner.queue_free()
	questioner2.activate()
	get_tree().get_first_node_in_group("player").can_move = false
	final_npc.position = Vector2(230, 70)
	
