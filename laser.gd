extends Area2D

export var velocidade = 600

func _ready():
	pass

func _process(delta):

	position.y -= velocidade * delta
	$tatakae.play()
	
	if(position.y <= -40):
		queue_free()
	
	pass
