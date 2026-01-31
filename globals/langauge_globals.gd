extends Node

@onready var player_dictionary = {
	"da":"food"
}

@onready var english_to_gleep = {
	"i":"db",
	"want":"od",
	"food":"da"
}

var gleep_to_english = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for k in english_to_gleep.keys():
		gleep_to_english[english_to_gleep[k]] = k

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
