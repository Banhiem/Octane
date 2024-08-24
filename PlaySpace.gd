extends Node2D
 
@onready var PlayerHand= load("res://Label.gd")
@onready var Cards= load("res://cards.tscn")
@onready var CardSelected=[]
@onready var DeckSize=PlayerHand.CardList.size()
@onready var ViewPort=$BackGround/TableTop.size
@onready var Card=load("res://cards.tscn").instantiate()
@onready var Focus = Card.get_node("Focus")
@onready var t=1
#@onready var CardSize=Vector2(130,200)
#@onready var NewCard=Cards.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround.scale *= (ViewPort/$BackGround.texture.get_size())*0.75
	$BackGround/TableTop.position=$BackGround.position
	print(DeckSize)








func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		CardSelected=randi_range(0, DeckSize-1)
		var NewCard=Cards.instantiate()
		NewCard.Name=PlayerHand.CardList[CardSelected]
		#NewCard.position=$P1Hand.position
		$Cards.add_child(NewCard)
		PlayerHand.CardList.erase(PlayerHand.CardList[CardSelected])
		DeckSize -= 1
		if(DeckSize>=62):
			NewCard.position=$P1Hand.position
			$P1Hand.position += Vector2(130,0)
		if(63>DeckSize and DeckSize>=58):
			NewCard.position=$P1DownCards.position
			$P1DownCards.position += Vector2(130,0)
		if(58>DeckSize and DeckSize>=53):
			NewCard.position=$P2DownCards.position
			$P2DownCards.position += Vector2(0,130)
			NewCard.rotation_degrees=90
		if(53>DeckSize and DeckSize>=48):
			NewCard.position=$P3DownCards.position
			$P3DownCards.position += Vector2(130,0)
			NewCard.rotation_degrees=180
		if(48>DeckSize and DeckSize>=43):
			NewCard.position=$P4DownCards.position
			$P4DownCards.position += Vector2(0,130)
			NewCard.rotation_degrees=-90
		if(DeckSize<43):
			NewCard.position=$CardPile.position

#func _input(event):
	#if Input.is_action_just_released("LeftMouse"):



