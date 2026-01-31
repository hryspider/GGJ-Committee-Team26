extends Node2D

@onready var dict_rune_scene = preload("res://ui/dictionary_rune.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var dict_rune_inst
	for word in LangaugeGlobals.mentioned_words:
		dict_rune_inst = dict_rune_scene.instantiate()
		dict_rune_inst.position = Vector2(randf(), randf())*get_viewport_rect().size
		add_child(dict_rune_inst)
		dict_rune_inst.rune.set_rune_text(word)
		dict_rune_inst.rune.set_text_overlay(LangaugeGlobals.gleep_to_english[word])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
