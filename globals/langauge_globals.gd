extends Node

var MAX_LENGTH = 6 #Longest possible guess

@onready var player_dictionary = {
}

@onready var english_to_gleep = {'where': 'pdl', 'me': 'n', 'know': 'na', 'have': 'mt', 'at': 'uju', 'must': 'ko', 'glorp': 'ml', 'get': 'hh', 'near': 'bb', 'we': 'j', 'here': 'jbg', 'go': 'sm', 'but': 'cb', 'hello': 'al', 'no': 'nq', 'job': 'ke', 'office': 'l', 'live': 'pop', 'yes': 'o', 'leave': 'kt', 'who': 'sq', 'milk': 'mg', 'money': 'it', 'shop': 'bp', 'fuck': 'p', 'boss': 'jq', 'love': 'uum', 'good': 'fkf', 'bad': 'ss', 'beer': 'cc', 'wife': 'rt', 'you': 'jn', 'work': 'pd', 'house':'ee'}

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
	"but",
	"you",
	"live",
	"good"
]

var confirmed_words = [

]

@onready var rune_colors = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for k in english_to_gleep.keys():
		gleep_to_english[english_to_gleep[k]] = k
	for w in initial_words:
		confirmed_words.append(english_to_gleep[w])
	mentioned_words += confirmed_words
	for i in english_to_gleep:
		rune_colors[i] = Color.from_hsv(randf(), randf_range(0.3, 0.6), 0.5)

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
	if english_to_gleep.has(gleep) and not mentioned_words.has(english_to_gleep[gleep]):
		mentioned_words.append(english_to_gleep[gleep])
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
