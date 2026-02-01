extends Node

var MAX_LENGTH = 5 #Longest possible guess

@onready var player_dictionary = {
}

@onready var english_to_gleep = {
	"where":"d",
	"me":"db",
	"know":"od",
	"have":"da",
	"at":"mg",
	"must":"a",
	"glorp":"tf",
	"get":"bta",
	"near":"di",
	"we":"dap",
	"here":"lap",
	"go":"ein",
	"but":"ane",
	"no":"oo",
	"hi": "eee"
}

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
	
