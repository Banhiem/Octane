extends MarginContainer

@onready var CardData = load("res://card_data.gd")
@onready var PlayerHand= load("res://Label.gd")
@onready var CardSelected=[]
@onready var DeckSize=PlayerHand.CardList.size()
var Name = 'Gladiator'
@onready var CardInfo = CardData.DATA[CardData.get(Name)]
@onready var Cardname = CardData.WarriorName[CardData.get(Name)]
@onready var CardImg = str("res://card_images/",Name,".jpg")
@onready var CardNum = CardInfo[1]
@onready var CardName = Cardname[0]
@onready var SpecialEffect = CardInfo[3]
var CardSize= self.get_size()/2
var CardScale= self.get_scale()
@onready var Cards= load("res://cards.tscn")

func CreateCard():
	$FullCard/Border/SpecialEffect.text=SpecialEffect
	$FullCard/Border/SpecialEffect/Card.texture=load(CardImg)
	$FullCard/Border.scale *= CardSize/$FullCard/Border.texture.get_size()   
	$FullCard/Border/SpecialEffect/Card.scale *= (($FullCard/Border/ImgArea.size/0.83)/$FullCard/Border/SpecialEffect/Card.texture.get_size())*(CardSize/$FullCard/Border.texture.get_size())
	$FullCard/Border/SpecialEffect/Card.position=$FullCard/Border/ImgArea.position
	$FullCard/Border/CardNum.text=CardNum
	$FullCard/Border/CardName.text=CardName 
	$FullCard/Border/SpecialEffect/Card.scale *= CardSize/$Focus.texture_hover.get_size()*1.3

enum{           #States of indivual cards
	InHand,
	InPile,                
	OnTable,
	FocusInHand
}

var state = InHand

func _ready():
	var ImgArea= $FullCard/Border/ImgArea.size/0.83
	$FullCard/Border/SpecialEffect.text=SpecialEffect
	$FullCard/Border/SpecialEffect/Card.texture=load(CardImg)
	$FullCard/Border.scale *= CardSize/$FullCard/Border.texture.get_size()   
	$FullCard/Border/SpecialEffect/Card.scale *= (ImgArea/$FullCard/Border/SpecialEffect/Card.texture.get_size())*(CardSize/$FullCard/Border.texture.get_size())
	$FullCard/Border/SpecialEffect/Card.position=$FullCard/Border/ImgArea.position
	$FullCard/Border/CardNum.text=CardNum
	$FullCard/Border/CardName.text=CardName
	await get_tree().process_frame
	var NewCard=Cards.instantiate()
	CardSelected=randi_range(0, DeckSize-1)
	#$Focus.scale *= CardSize/$Focus.texture_hover.get_size()*3
	$FullCard.size = Vector2(200,300)






func _physics_process(delta):
	match state:
		InHand:
			$Focus.scale = CardSize/$Focus.texture_hover.get_size()*0.5
		InPile:
			pass
		OnTable:
			pass
		FocusInHand:
			$Focus.scale = CardSize/$Focus.texture_hover.get_size()*1.5
			#$Focus.position = Vector2(0,-100)
			#pass

func _on_focus_mouse_entered():
	match state:
		InHand, OnTable, InPile:
			state = FocusInHand

func _on_focus_mouse_exited():
	match state:
		FocusInHand:
			state = InHand
