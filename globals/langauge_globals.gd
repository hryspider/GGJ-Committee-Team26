extends Node

var MAX_LENGTH = 5 #Longest possible guess

@onready var player_dictionary = {
}

@onready var english_to_gleep = {
	"hello":"d",
	"money":"it",
	"me":"db",
	"want":"od",
	"food":"da",
	"milk":"mg",
}

var gleep_to_english = {}

var mentioned_words = [
	"mg",
	"da",
	"d",
	"od",
	"eee",
	"tf",
	"a"
]
var confirmed_words = [
]

@onready var rune_colors = {
	"hello":Color(0.0, 0.0, 0.0, 1.0),
	"me":Color(0.0, 0.0, 0.0, 1.0),
	"want":Color(0.0, 0.0, 0.0, 1.0),
	"food":Color(0.0, 0.0, 0.0, 1.0),
	"milk":Color(0.0, 0.0, 0.0, 1.0),
	"test":Color(0.0, 0.0, 0.0, 1.0),
	"bepis":Color(0.0, 0.0, 0.0, 1.0),
	"slop":Color(0.0, 0.576, 0.0, 1.0)
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for k in english_to_gleep.keys():
		gleep_to_english[english_to_gleep[k]] = k

func get_player_guess(gleep) -> String:
	if player_dictionary.has(gleep): return player_dictionary[gleep]
	return ""

func is_known(gleep):
	return confirmed_words.has(gleep)

func add_word_mention(gleep):
	if gleep_to_english.has(gleep) and not mentioned_words.has(gleep):
		mentioned_words.append(gleep)
func add_word_confirmed(gleep):
	if gleep_to_english.has(gleep) and not confirmed_words.has(gleep):
		confirmed_words.append(gleep)
