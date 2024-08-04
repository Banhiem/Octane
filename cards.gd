extends MarginContainer



var CardData = preload("res://card_data.tscn") 
var Cardname = 'Footman'
var CardInfo = CardData.get(Cardname)


func _ready():
	print(CardInfo)
	var size = self.size
	print("MarginContainer Size",size)
	#var CardSize = $MarginContainer.rect_size
	#$Border.scale *= CardSize/$Border.texture.get_size()   
	
	


