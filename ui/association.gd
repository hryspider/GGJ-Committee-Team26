extends HBoxContainer
@onready var human = $Human
@onready var gleep = $Gleep


var word = ""

func _ready():
	gleep.text = word
	human.text = LangaugeGlobals.gleep_to_english[word] 
