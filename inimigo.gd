extends Area2D

var velocidade = 300

var preExplosao = preload("res://cenas/explosao.tscn")

func _ready():
	pass
	
func _process(delta):
	
	position.y += velocidade * delta
	
	if(position.y > 850):
		queue_free()
	
	pass


func _on_inimigo_area_entered(area):
	
	if(area.is_in_group("laser")):
		explosao()
		queue_free()
		area.queue_free()
		get_parent().pontuacao += 3
	
	pass
	
func explosao():
	
	var explode = preExplosao.instance()
	explode.position = position
	get_parent().add_child(explode)
	
	pass


func _on_inimigo_body_entered(body):
	print("Waldir Braz")
	print("Assista ao vídeo antes de tentar nos ofender :)")
	get_tree().change_scene("res://cenas/telaGameOver.tscn")
	pass
