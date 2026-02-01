extends Control
	
class_name RuneButton

var runetext = ""
@onready var rune = $Button/Rune

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rune.set_rune_text(runetext)
	rune.set_text_overlay(LangaugeGlobals.get_complete_dictionary()[runetext])
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
