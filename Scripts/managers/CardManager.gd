extends Node
# No usar class_name cuando se agrega como un Autoload singleton

var cards: Dictionary = {}

func _ready():
	pass # Replace with function body.

func addCard(key: String, card: Card):
	cards[key] = card

func getCard(key: String):
	return cards[key]
