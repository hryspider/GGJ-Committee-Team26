extends Control

@onready var dict_rune_scene = preload("res://ui/dictionary_rune.tscn")
@onready var dict_assoc_scene = preload("res://ui/association.tscn")
@onready var rune_children = []
@onready var v_box_container = $KnownWords/ScrollContainer/VBoxContainer
@onready var button = $Button
var on_known_words_menu = false
@onready var known_words = $KnownWords
# Called when the node enters the scene tree for the first time.
func _ready():
	var dict_rune_inst
	var dict_assoc_inst
	for word in LangaugeGlobals.confirmed_words:
		dict_assoc_inst = dict_assoc_scene.instantiate()
		dict_assoc_inst.word = word
		v_box_container.add_child(dict_assoc_inst)
	print(LangaugeGlobals.mentioned_words)
	for word in LangaugeGlobals.mentioned_words:
		if not LangaugeGlobals.is_known(word):
			dict_rune_inst = dict_rune_scene.instantiate()
			dict_rune_inst.position = Vector2(randf(), randf())*(get_viewport_rect().size/2) + (get_viewport_rect().size/4)
			add_child(dict_rune_inst)
			rune_children.append(dict_rune_inst)
			dict_rune_inst.rune.set_rune_text(word)
			dict_rune_inst.connect("editing", editing, 1)
			dict_rune_inst.connect("edit_finished", edit_finished)
			dict_rune_inst.rune.set_text_overlay(LangaugeGlobals.get_player_guess(word))
			#dict_rune_inst.rune.set_rune_fade(true)

func editing(rune_pos):
	for r in rune_children:
		r.apply_central_force((r.position-rune_pos)*10)
		if r.position == rune_pos: r.apply_random_spin()
		r.unhoverable = true
func edit_finished():
	LangaugeGlobals.player_dictionary = {}
	for r in rune_children:
		r.unhoverable = false
		r.apply_central_force(Vector2(randf(), randf())*10000)
		LangaugeGlobals.player_dictionary[r.rune.get_rune_text()] = r.rune.get_text_overlay()


func _on_button_pressed():
	button.focus_mode = false
	on_known_words_menu = !on_known_words_menu
	button.text = "Back" if on_known_words_menu else "Confirmed\nwords"
	known_words.visible = on_known_words_menu
	if on_known_words_menu:
		for r in rune_children:
			r.unhoverable = true
			if r.being_edited:
				r.finish_edit()
	else:
		for r in rune_children:
			r.unhoverable = false
	
