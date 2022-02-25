extends Area2D

var velocidade = 200

const PRE_EXPLOSAO = preload("res://cenas/explosao.tscn")

func _ready():
	pass

func _process(delta):
	position.y += velocidade * delta
	
	if(position.y >= 900):
		queue_free()
	
	pass


func _on_asteroide_area_entered(area):
	
	if area.is_in_group("laser"):
		explodir()
		queue_free()
		area.queue_free()
	
	pass
func explodir():
	
	var explode = PRE_EXPLOSAO.instance()
	explode.position = position
	explode.position.y -= 175
	explode.position.x += 50
	get_parent().add_child(explode)
	 
	pass
