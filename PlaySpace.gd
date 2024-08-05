extends Node2D
 
@onready var PlayerHand= load("res://Label.gd")
@onready var Cards= load("res://cards.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass


func _input(event):
	if Input.is_action_just_pressed("spacebar"):
		var NewCard=Cards.instantiate()
		NewCard.Name='Gladiator'
		NewCard.position=get_global_mouse_position()
		$Cards.add_child(NewCard)