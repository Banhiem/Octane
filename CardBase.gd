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
var CardSize= self.get_size()
var CardScale= self.get_scale()
@onready var Cards= load("res://cards.tscn")
@onready var NewCard=Cards.instantiate()
@onready var Space = load("res://play_space.tscn").instantiate()
@onready var CardPos2=Space.get_node("P2DownCards")
@onready var CardPos3=Space.get_node("P3DownCards")
@onready var CardPos4=Space.get_node("P4DownCards")
@onready var Pile=Space.get_node("CardPile")
@onready var t=1

#func CreateCard():
	#$FullCard/Border/SpecialEffect.text=SpecialEffect
	#$FullCard/Border/SpecialEffect/Card.texture=load(CardImg)
	#$FullCard/Border.scale *= CardSize/$FullCard/Border.texture.get_size()   
	#$FullCard/Border/SpecialEffect/Card.scale *= (($FullCard/Border/ImgArea.size/0.83)/$FullCard/Border/SpecialEffect/Card.texture.get_size())*(CardSize/$FullCard/Border.texture.get_size())
	#$FullCard/Border/SpecialEffect/Card.position=$FullCard/Border/ImgArea.position
	#$FullCard/Border/CardNum.text=CardNum
	#$FullCard/Border/CardName.text=CardName 
	#$FullCard/Border/SpecialEffect/Card.scale *= CardSize/$Focus.texture_hover.get_size()*1.3

enum{           #States of indivual cards
	InHand,
	InPile,                
	OnTable,
	FocusInHand
}

var state = InHand

func _ready():
	var ImgArea= $FullCard/Border/ImgArea.size*1.83
	$FullCard/Border/SpecialEffect.text=SpecialEffect
	$FullCard/Border/SpecialEffect/Card.texture=load(CardImg)
	$FullCard/Border.scale *= CardSize/$FullCard/Border.texture.get_size()   
	$FullCard/Border/SpecialEffect/Card.scale *= (ImgArea/$FullCard/Border/SpecialEffect/Card.texture.get_size())*(CardSize/$FullCard/Border.texture.get_size())
	$FullCard/Border/SpecialEffect/Card.position=$FullCard/Border/ImgArea.position
	$FullCard/Border/CardNum.text=CardNum
	$FullCard/Border/CardName.text=CardName
	await get_tree().process_frame
	CardSelected=randi_range(0, DeckSize-1)
	$FullCard.size = Vector2(130,200)
	NewCard.position=CardPos4.position
	print(Pile.position)






func _physics_process(delta):
	match state:
		InHand:
			$Focus.scale = CardSize/$Focus.texture_hover.get_size()*0.75
		InPile:
			$Focus.scale = CardSize/$Focus.texture_hover.get_size()*1.5
			self.global_position=lerp(CardPos2.position,Pile.position,t)
			#if (self.global_position==Pile.position):
				#$Focus.roatation_degrees=0
			if(NewCard.position==CardPos2.position):
				self.rotation_degrees=0
			if(NewCard.position==CardPos3.position):
				self.rotation_degrees=0
			if(NewCard.position==CardPos4.position):
				self.rotation_degrees=0
		OnTable:
			$Focus.scale = CardSize/$Focus.texture_hover.get_size()*0.75
		FocusInHand:
			$Focus.scale = CardSize/$Focus.texture_hover.get_size()*1.5
			if(NewCard.position==CardPos2.position):
				$Focus.rotation_degrees=-90
				$Focus.position=Vector2(0,175)
				$Focus.scale=CardSize/$Focus.texture_hover.get_size()*1.2
			if(NewCard.position==CardPos3.position):
				$Focus.rotation_degrees=180
				$Focus.position=Vector2(130,200)
				$Focus.scale=CardSize/$Focus.texture_hover.get_size()*1.2
			if(NewCard.position==CardPos4.position):
				$Focus.rotation_degrees=90
				$Focus.position=Vector2(250,50)
				$Focus.scale=CardSize/$Focus.texture_hover.get_size()*1.2


func _on_focus_mouse_entered():
	match state:
		InHand, OnTable, InPile:
			state = FocusInHand

func _on_focus_mouse_exited():
	match state:
		FocusInHand:
			state = InHand



func _on_focus_pressed():
	match state:
		InHand, OnTable, FocusInHand:
			state=InPile
