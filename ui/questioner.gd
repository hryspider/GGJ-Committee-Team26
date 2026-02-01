extends Control

var word = ""
var aliases = []
var correct = false

signal questionerCorrect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#$Label3.text = word
	pass # Replace with function body.

func start():
	$Label3.text = word

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if aliases.has(LangaugeGlobals.get_player_guess(word)):
		if !correct:
			correct = true	
			emit_signal("questionerCorrect")
	else:
		correct = false
		
func _input(event):
	if event is InputEventKey and event.pressed:
		visible = false 
