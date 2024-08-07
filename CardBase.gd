extends MarginContainer



@onready var CardData = load("res://card_data.gd") 
var Name = 'Gladiator'
@onready var CardInfo = CardData.DATA[CardData.get(Name)]
@onready var Cardname = CardData.WarriorName[CardData.get(Name)]
@onready var CardImg = str("res://card_images/",Name,".jpg")
@onready var CardNum = CardInfo[1]
@onready var CardName = Cardname[0]
@onready var SpecialEffect = CardInfo[3]



func _ready():
	$Border/SpecialEffect.text=SpecialEffect
	var CardSize = self.size
	var ImgArea= $Border/ImgArea.size
	$Border/SpecialEffect/Card.texture= load(CardImg)
	$Border.scale *= CardSize/$Border.texture.get_size()   
	$Border/SpecialEffect/Card.scale *= (ImgArea/$Border/SpecialEffect/Card.texture.get_size())*(CardSize/$Border.texture.get_size())
	$Border/SpecialEffect/Card.position=$Border/ImgArea.position
	$Border/CardNum.text=CardNum
	$Border/CardName.text=CardName
	print($Border/ImgArea.position)


