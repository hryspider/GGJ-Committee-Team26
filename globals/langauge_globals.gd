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
	"mg",
	"da"
]
var confirmed_words = [
	
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for k in english_to_gleep.keys():
		gleep_to_english[english_to_gleep[k]] = k

func get_player_guess(gleep) -> String:
	if player_dictionary.has(gleep): return player_dictionary[gleep]
	return "???"

func is_known(gleep):
	return confirmed_words.has(gleep)

func add_word_mention(gleep):
	if gleep_to_english.has(gleep) and not mentioned_words.has(gleep):
		mentioned_words.append(gleep)
func add_word_confirmed(gleep):
	if gleep_to_english.has(gleep) and not confirmed_words.has(gleep):
		confirmed_words.append(gleep)
