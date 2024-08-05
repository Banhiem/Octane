extends MarginContainer



@onready var CardData = load("res://card_data.gd") 
var Name = 'Centurion'
@onready var CardInfo = CardData.DATA[CardData.get(Name)]
@onready var Cardname = CardData.WarriorName[CardData.get(Name)]
@onready var CardImg = str("res://card_images/",Name,".jpg")
@onready var CardNum = CardInfo[1]
@onready var CardName = Cardname[0]
@onready var SpecialEffect = CardInfo[3]



func _ready():
	var CardSize = self.size
	var ImgArea= $Border/ImgArea.size
	$Border/SpecialEffect.text=SpecialEffect
	$Card.texture= load(CardImg)
	$Border.scale *= CardSize/$Border.texture.get_size()   
	$Card.scale *= (ImgArea/$Card.texture.get_size())*(CardSize/$Border.texture.get_size())
	$Card.position=$Border/ImgArea.position
	$Border/CardNum.text=CardNum
	$Border/CardName.text=CardName

