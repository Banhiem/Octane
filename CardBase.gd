extends MarginContainer



@onready var CardData = load("res://card_data.gd") 
var Name = 'Gladiator'
@onready var CardInfo = CardData.DATA[CardData.get(Name)]
@onready var Cardname = CardData.WarriorName[CardData.get(Name)]
@onready var CardImg = str("res://card_images/",Name,".jpg")
@onready var CardNum = CardInfo[1]
@onready var CardName = Cardname[0]
@onready var SpecialEffect = CardInfo[3]

enum{           #States of indivual cards
	InHand,
	InPile,                
	OnTable,
	FocusInHand
}

var state = OnTable



func _ready():
	$Border/SpecialEffect.text=SpecialEffect
	var CardSize= self.get_size()/5
	var ImgArea= $Border/ImgArea.size*1.3
	$Border/SpecialEffect/Card.texture=load(CardImg)
	$Border.scale *= CardSize/$Border.texture.get_size()   
	$Border/SpecialEffect/Card.scale *= (ImgArea/$Border/SpecialEffect/Card.texture.get_size())*(CardSize/$Border.texture.get_size())
	$Border/SpecialEffect/Card.position=$Border/ImgArea.position
	$Border/CardNum.text=CardNum
	$Border/CardName.text=CardName
	$Focus.scale = CardSize/$Focus.size


func _physics_process(delta):
	match state:
		InHand:
			pass
		InPile:
			pass
		OnTable:
			pass
		FocusInHand:
			pass




func _on_focus_mouse_entered():
	match state:
		InHand, OnTable, InPile:
			state = FocusInHand


func _on_focus_mouse_exited():
	match state:
		FocusInHand:
			state = InHand
