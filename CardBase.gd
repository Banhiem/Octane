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
	$Border/SpecialEffect.text=SpecialEffect
	$Border/SpecialEffect/Card.texture=load(CardImg)
	$Border.scale *= CardSize/$Border.texture.get_size()   
	$Border/SpecialEffect/Card.scale *= (($Border/ImgArea.size/0.83)/$Border/SpecialEffect/Card.texture.get_size())*(CardSize/$Border.texture.get_size())
	$Border/SpecialEffect/Card.position=$Border/ImgArea.position
	$Border/CardNum.text=CardNum
	$Border/CardName.text=CardName 
	$Border/SpecialEffect/Card.scale *= CardSize/$Focus.texture_hover.get_size()*1.3

enum{           #States of indivual cards
	InHand,
	InPile,                
	OnTable,
	FocusInHand
}

var state = InHand



func _ready():
	var ImgArea= $Border/ImgArea.size/0.83
	$Border/SpecialEffect.text=SpecialEffect
	$Border/SpecialEffect/Card.texture=load(CardImg)
	$Border.scale *= CardSize/$Border.texture.get_size()   
	$Border/SpecialEffect/Card.scale *= (ImgArea/$Border/SpecialEffect/Card.texture.get_size())*(CardSize/$Border.texture.get_size())
	$Border/SpecialEffect/Card.position=$Border/ImgArea.position
	$Border/CardNum.text=CardNum
	$Border/CardName.text=CardName
	await get_tree().process_frame
	var NewCard=Cards.instantiate()
	CardSelected=randi_range(0, DeckSize-1)
	$Focus.scale *= CardSize/$Focus.texture_hover.get_size()*1.5
	#$Focus.texture_hover= CreateCard()


func _physics_process(delta):
	match state:
		InHand:
			pass
		InPile:
			pass
		OnTable:
			pass
		FocusInHand:
			#$Border.scale *= (CardSize)/$Border.texture.get_size()
			pass




func _on_focus_mouse_entered():
	match state:
		InHand, OnTable, InPile:
			state = FocusInHand


func _on_focus_mouse_exited():
	match state:
		FocusInHand:
			state = InHand
