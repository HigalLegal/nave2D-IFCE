extends KinematicBody2D

var aceleracao = 300
const PRE_LASER = preload("res://cenas/laser.tscn")

func _ready():
	pass
	
func _process(delta):
	
	var dir = Vector2.ZERO
	
	$sprite.animation = "default"
	
	if Input.is_action_pressed("esquerda"):
		dir.x -= aceleracao
		$sprite.animation="esquerda"
	if Input.is_action_pressed("direita"):
		dir.x += aceleracao
		$sprite.animation="direita"
	if Input.is_action_pressed("cima"):
		dir.y -= aceleracao
	if Input.is_action_pressed("baixo"):
		dir.y += aceleracao
	
	#LIMITANDO MOVIMENTAÇÃO NA HORIZONTAL
	if(position.x <= 30):
		position.x = 30
		
	if(position.x >= 480):
		position.x = 480
	
	#LIMITANDO MOVIMENTAÇÃO NA VERTICAL
	if(position.y <= 30):
		position.y = 30
	if(position.y >= 730):
		position.y = 730
	
	move_and_slide(dir)
	
	if Input.is_action_just_pressed("atirar"):
		laser()
	
	pass


func laser():
	
	
	
	$tatakae.play()
	
	var atirador = PRE_LASER.instance()
	
	atirador.position = position
	get_parent().add_child(atirador)
	
	atirador.add_to_group("laser")
	
	pass
