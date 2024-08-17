extends Node2D
 
@onready var PlayerHand= load("res://Label.gd")
@onready var Cards= load("res://cards.tscn")
@onready var CardSelected=[]
@onready var DeckSize=PlayerHand.CardList.size()
@onready var ViewPort=$BackGround/TableTop.size
# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround.scale *= (ViewPort/$BackGround.texture.get_size())*0.9
	$BackGround/TableTop.position=$BackGround.position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		var NewCard=Cards.instantiate()
		CardSelected=randi_range(0, DeckSize-1)
		NewCard.Name=PlayerHand.CardList[CardSelected]
		NewCard.position=$P1DownCards.position
		$Cards.add_child(NewCard)
		$P1DownCards.position += Vector2(190,0)
		


