extends Node2D
@onready var questioner = $Questioner


var flags = [false, false, false]:
	set(value):
		flags = value
		if flags == [true, true, true]:
			questioner.activate()

func _on_dialog_manager_finished():
	flags[0] = true


func _on_milk_overlay_finished():
	flags[1] = true


func _on_money_overlay_finished():
	flags[2] = true


		
