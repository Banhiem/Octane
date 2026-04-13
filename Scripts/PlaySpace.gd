extends Node2D

# --- Resources ---
var Deck = preload("res://Scripts/Label.gd")
var CardTemplate = preload("res://Scenes/cards.tscn")

# --- Runtime state ---
var DeckSize = null
var ViewPort = null
var Focus = null
var CardSelected = []
var P1Cards = []
var P1Down = []
var P2Down = []
var P3Down = []
var P4Down = []
var PileCards = []
var t = 1

# --- Runtime nodes ---
var new_card
var card

# Called when the node enters the scene tree for the first time.
func _ready():
	ViewPort = $BackGround/TableTop.size
	$BackGround.scale *= (ViewPort / $BackGround.texture.get_size()) * 0.75
	$BackGround/TableTop.position = $BackGround.position
	DeckSize = Deck.CardList.size()


func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		CardSelected = randi_range(0, DeckSize - 1)
		var NewCard = CardTemplate.instantiate()
		NewCard.Name = Deck.CardList[CardSelected]

		$Cards.add_child(NewCard)
		$Cards.move_child(NewCard, 0)

		Deck.CardList.erase(Deck.CardList[CardSelected])
		DeckSize -= 1
		if (DeckSize >= 68):
			NewCard.position = $P1Hand.position
			$P1Hand.position += Vector2(130, 0)
		if (68 > DeckSize and DeckSize >= 63):
			NewCard.position = $P1DownCards.position
			$P1DownCards.position += Vector2(130, 0)
		if (63 > DeckSize and DeckSize >= 58):
			NewCard.position = $P2DownCards.position
			$P2DownCards.position += Vector2(0, 130)
			NewCard.rotation_degrees = 90
		if (58 > DeckSize and DeckSize >= 53):
			NewCard.position = $P3DownCards.position
			$P3DownCards.position += Vector2(130, 0)
			NewCard.rotation_degrees = 180
		if (53 > DeckSize and DeckSize >= 48):
			NewCard.position = $P4DownCards.position
			$P4DownCards.position += Vector2(0, 130)
			NewCard.rotation_degrees = -90
