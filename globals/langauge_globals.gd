extends Node

var MAX_LENGTH = 5 #Longest possible guess

@onready var player_dictionary = {
}

@onready var english_to_gleep = {'where': 'pdl', 'me': 'n', 'know': 'na', 'have': 'mt', 'at': 'ujk', 'must': 'ko', 'glorp': 'ml', 'get': 'ubh', 'near': 'b', 'we': 'j', 'here': 'jbg', 'go': 'sm', 'but': 'cb', 'hello': 'al', 'no': 'nq', 'job': 'ke', 'office': 'l', 'live': 'ab', 'yes': 'ao', 'leave': 'kt', 'who': 'sq', 'milk': 'mg', 'money': 'it', 'shop': 'bp', 'fuck': 'p', 'boss': 'jq', 'love': 'gum', 'good': 'fks', 'bad': 'ss', 'beer': 'prg', 'wife': 'rt', 'you': 'jn', 'work': 'pd'}

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
	for w in initial_words:
		confirmed_words.append(english_to_gleep[w])
	mentioned_words += confirmed_words

func get_player_guess(gleep) -> String:
	if player_dictionary.has(gleep): return player_dictionary[gleep]
	return ""

func get_complete_dictionary():
	var dict = {}
		
	for item in mentioned_words:
		dict[item] = get_player_guess(item)
		
	for item in confirmed_words:
		dict[item] = gleep_to_english[item]
		
	return dict

func is_known(gleep):
	return confirmed_words.has(gleep)

func add_word_mention(gleep):
	if gleep_to_english.has(gleep) and not mentioned_words.has(gleep):
		mentioned_words.append(gleep)
func add_word_confirmed(gleep):
	if gleep_to_english.has(gleep) and not confirmed_words.has(gleep):
		confirmed_words.append(gleep)
		WordPopup.unlock(gleep)
		
func spawn_questioner(gleep, gleep_aliases):
	if has_node("Questioner"):
		get_node("Questioner").visible = true
	else:
		var questioner_res = load("res://ui/questioner.tscn")
		var instance = questioner_res.instantiate()
		add_child(instance)
		
		instance.control.word = gleep
		instance.control.aliases = gleep_aliases
		
		instance.control.start()

func spawn_talk_selector():
	var talk_selector_res = load("res://ui/talk_selector.tscn")
	var instance = talk_selector_res.instantiate()
	add_child(instance)
	
	instance.control.start()
