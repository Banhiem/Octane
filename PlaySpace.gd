extends Node2D
 
@onready var PlayerHand= load("res://Label.gd")
@onready var Cards= load("res://cards.tscn")
@onready var CardSelected=[]
@onready var DeckSize=PlayerHand.CardList.size()
@onready var ViewPort=$BackGround/TableTop.size
@onready var Card=load("res://cards.tscn").instantiate()
@onready var Focus = Card.get_node("Focus")
# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround.scale *= (ViewPort/$BackGround.texture.get_size())*0.75
	$BackGround/TableTop.position=$BackGround.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		CardSelected=randi_range(0, DeckSize-1)
		var NewCard=Cards.instantiate()
		NewCard.Name=PlayerHand.CardList[CardSelected]
		NewCard.position=$P4DownCards.position
		$Cards.add_child(NewCard)
		if(NewCard.position==$P2DownCards.position):
			NewCard.rotation_degrees=90
		if(NewCard.position==$P3DownCards.position):
			NewCard.rotation_degrees=180
		if(NewCard.position==$"P4DownCards".position):
			NewCard.rotation_degrees=-90
		$P1DownCards.position += Vector2(130,0)
		$P1Hand.position += Vector2(130,0)
		$P2DownCards.position += Vector2(0,130)
		$P3DownCards.position += Vector2(130,0) 
		$P4DownCards.position += Vector2(0,130)

#func _input(event):
	#if Input.is_action_just_released("LeftMouse"):



