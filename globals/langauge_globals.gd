extends Node

var MAX_LENGTH = 5 #Longest possible guess

@onready var player_dictionary = {
}

@onready var english_to_gleep = {'where': 'd', 'me': 'tpq', 'know': 'fo', 'have': 'lsl', 'at': 'brpo', 'must': 'lhuh', 'glorp': 'qk', 'get': 'dmt', 'near': 'f', 'we': 'kre', 'here': 'orf', 'go': 'og', 'but': 'cuud', 'hello': 'qint', 'no': 't', 'job': 'scr', 'office': 'h', 'live': 'ial', 'yes': 'gtf', 'leave': 'n', 'who': 'a', 'milk': 'mpff', 'money': 'o', 'shop': 'ean', 'expletive': 'jsts', 'boss': 'jgf', 'love': 'ci', 'good': 'tfj', 'bad': 'if', 'beer': 'jib', 'wife': 'p'}

var gleep_to_english = {}

var mentioned_words = [

]
var initial_words = [
	"where",
	"me",
	"know",
	"have",
	"at",
	"must",
	"glorp",
	"get",
	"near",
	"we",
	"here",
	"go",
	"but"
]

var confirmed_words = [
	"d",
	"od",
	"da",
	"mg",
	"a",
	"tf",
	"bta",
	"di",
	"dap",
	"lap",
	"ein",
	"ane"
]

@onready var rune_colors = {
	"where":Color(0.0, 0.0, 0.0, 1.0),
	"me":Color(0.655, 0.0, 0.0, 1.0),
	"know":Color(0.0, 0.0, 0.0, 1.0),
	"have":Color(0.0, 0.0, 0.0, 1.0),
	"at":Color(0.0, 0.0, 0.0, 1.0),
	"must":Color(0.0, 0.0, 0.0, 1.0),
	"glorp":Color(0.0, 0.0, 0.0, 1.0),
	"get":Color(0.0, 0.0, 0.0, 1.0),
	"near":Color(0.0, 0.0, 0.0, 1.0),
	"we":Color(0.0, 0.0, 0.0, 1.0),
	"here":Color(0.0, 0.0, 0.0, 1.0),
	"go":Color(0.0, 0.0, 0.0, 1.0),
	"but":Color(0.0, 0.0, 0.0, 1.0),
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
		
func spawn_questioner(gleep):
	var questioner = load("res://ui/questioner.tscn")
	var instance = questioner.instantiate()
	
	instance.word = gleep
	instance.move_to_front()
	
	add_child(instance)
