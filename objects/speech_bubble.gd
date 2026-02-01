extends Node2D

@onready var runes := [$Control/Rune1, $Control/Rune2, $Control/Rune3, $Control/Rune4, $Control/Rune5, $Control/Rune6]
var words = []
var visible_chars = 0
@onready var appear_timer = $AppearTimer
@onready var destroy_timer = $DestroyTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	set_text("me want food want me food")
	set_instance_shader_parameter("color", Color.WHITE)
	
func set_text(new_text):
	words = new_text.split(" ",false,len(runes))
	for i in range(len(runes)):
		if i < len(words):
			var w = words[i]
			runes[i].set_rune_text(LangaugeGlobals.english_to_gleep[w])
			runes[i].set_text_overlay("")
		else:
			runes[i].queue_free()
	refresh_text()
			
func refresh_text():
	for i in range(len(runes)):
		if i < len(words):
			var new_text = LangaugeGlobals.player_dictionary.get(runes[i].get_rune_text(), "")
			if new_text: runes[i].set_text_overlay(new_text)

func play():
	set_visible_words(0)
	appear_timer.start()

func set_visible_words(n):
	for i in range(runes.size()):
		runes[i].visible = i<n


func _on_appear_timer_timeout():
	if visible_chars < 5:
		visible_chars += 1
		set_visible_words(visible_chars)
	else:
		appear_timer.stop()
		destroy_timer.start()

func _on_destroy_timer_timeout():
	queue_free()
