extends Control

@onready var rune_label : Label = $RuneLabel
@onready var text_label : Label = $TextOverlay
var rune_color : Color = Color.WHITE
var rune_color_faded : Color = Color.DIM_GRAY
var text_color : Color = Color.INDIAN_RED
var default_label_text := ""
var default_rune_text := "abcd"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text_overlay(default_label_text)
	set_rune_text(default_rune_text)

func set_rune_text(new_text):
	rune_color = LangaugeGlobals.rune_colors.get(LangaugeGlobals.gleep_to_english.get(new_text, ""), Color.WHITE)
	rune_color_faded = rune_color
	rune_color_faded.a *= .3
	rune_label.set_text(new_text)

func set_text_overlay(new_text):
	text_label.set_text(new_text)
	set_rune_fade(new_text != "")

func set_rune_fade(faded):
	rune_label.set_instance_shader_parameter("color", rune_color_faded if faded else rune_color)

func get_rune_text():
	return rune_label.text

func get_text_overlay():
	return text_label.text

func put_text_overlay_below():
	text_label.position.y = 0
