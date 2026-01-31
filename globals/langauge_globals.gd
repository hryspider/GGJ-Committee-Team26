extends Node

@onready var player_dictionary = {
	"da":"food"
}

@onready var english_to_gleep = {
	"me":"db",
	"want":"od",
	"food":"da",
	"milk":"mg"
}

var gleep_to_english = {}

var mentioned_words = [
	"mg"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for k in english_to_gleep.keys():
		gleep_to_english[english_to_gleep[k]] = k

func add_word(word):
	if gleep_to_english.has(word) and not mentioned_words.has(word):
		mentioned_words.append(word)
