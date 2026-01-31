extends TextureRect

@onready var runes := [$Control/Rune1, $Control/Rune2, $Control/Rune3, $Control/Rune4]
var words = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("i want food")
	set_instance_shader_parameter("color", Color.WHITE)
	
func set_text(new_text):
	words = new_text.split(" ",false,4)
	for i in range(4):
		if i < len(words):
			var w = words[i]
			runes[i].set_rune_text(LangaugeGlobals.english_to_gleep[w])
			runes[i].set_text_overlay("")
		else:
			runes[i].queue_free()
	refresh_text()
			
func refresh_text():
	for i in range(4):
		if i < len(words):
			var new_text = LangaugeGlobals.player_dictionary.get(runes[i].get_rune_text(), "")
			if new_text: runes[i].set_text_overlay(new_text)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
