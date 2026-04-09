extends Node2D

@onready var PlayerHand = load("res://Scripts/Label.gd")
@onready var Cards = load("res://Scenes/cards.tscn")
@onready var NewCard = Cards.instantiate()
@onready var CardSelected = []
@onready var DeckSize = PlayerHand.CardList.size()
@onready var ViewPort = $BackGround/TableTop.size
@onready var Card = load("res://Scenes/cards.tscn").instantiate()
@onready var Focus = Card.get_node("Focus")
@onready var t = 1
@onready var P1Cards = []
@onready var P1Down = []
@onready var P2Down = []
@onready var P3Down = []
@onready var P4Down = []
@onready var PileCards = []
#@onready var CardSize=Vector2(130,200)
#@onready var NewCard=Cards.instantiate()


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround.scale *= (ViewPort / $BackGround.texture.get_size()) * 0.75
	$BackGround/TableTop.position = $BackGround.position
	# print(NewCard.position)
	#if(NewCard.position==$CardPile.position):
	#NewCard.z_index*=0
	#NewCard.z_as_relative=false
	#NewCard.top_layer=true
	#print($Cards.get_index())


func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		CardSelected = randi_range(0, DeckSize - 1)
		var NewCard = Cards.instantiate()
		NewCard.Name = PlayerHand.CardList[CardSelected]
		#NewCard.position=$P1Hand.position
		$Cards.add_child(NewCard)
		#$Cards.get_index()
		$Cards.move_child(NewCard, 0)
		PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
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
		#if(DeckSize<48):
		#NewCard.position=$CardPile.position
		#if(DeckSize<47):
		#NewCard.position=$Discard.position
		# print(PileCards)
	#if (NewCard.position.y==1050):
	#P1Cards.push_front(NewCard.Name)
	#if (NewCard.position.y==850):
	#P1Down.push_front(NewCard.Name)
	#if (NewCard.position.x==600):
	#P2Down.push_front(NewCard.Name)
	#if (NewCard.position.y==300):
	#P3Down.push_front(NewCard.Name)
	#if (NewCard.position.x==1900):
	#P4Down.push_front(NewCard.Name)
	#if (NewCard.position==Vector2(500,500)):
	#PileCards.push_front(NewCard.Name)
	# print(NewCard.position)
	#if Input.is_action_just_pressed("left mouse click"):

	#func _process(delta):
