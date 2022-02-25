extends Area2D

export var velocidade = 600

func _ready():
	pass

func _process(delta):

	position.y -= velocidade * delta
	$tatakae.play()
	
	pass
