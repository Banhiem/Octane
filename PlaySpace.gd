extends Node2D
 
@onready var PlayerHand= load("res://Label.gd")
@onready var Cards= load("res://cards.tscn")
@onready var CardSelected=[]
@onready var DeckSize=PlayerHand.CardList.size()
@onready var ViewPort=$BackGround/TableTop.size
#@onready var Card=load("res://cards.tscn").instantiate()
@onready var Focus = $CardBase/Focus
# Called when the node enters the scene tree for the first time.
func _ready():
	$BackGround.scale *= (ViewPort/$BackGround.texture.get_size())*0.75
	$BackGround/TableTop.position=$BackGround.position
	print(Focus.rotation_degrees)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		var NewCard=Cards.instantiate()
		CardSelected=randi_range(0, DeckSize-1)
		NewCard.Name=PlayerHand.CardList[CardSelected]
		NewCard.position=$P2DownCards.position
		$Cards.add_child(NewCard)
		if(NewCard.position==$P2DownCards.position):
			NewCard.rotation_degrees=90
		if(NewCard.position==$P2DownCards.position):
			Focus.rotation_degrees=-90
		$P1DownCards.position += Vector2(130,0)
		$P1Hand.position += Vector2(130,0)
		$P2DownCards.position += Vector2(0,130) 



