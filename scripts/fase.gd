extends Node2D

var preInimigo = preload("res://cenas/asteroide.tscn")
var tempo = 0
var tempoMax = 2

var preInimigo2 = preload("res://cenas/inimigo.tscn")
var tempoNave = 0
var tempoMaxNave = 1

var pontuacao = 0

func _ready():
	$tema.play()
	$botao.focus_mode = false
	pass

func _process(delta):
	
	tempoNave += delta
	
	if(tempoNave > tempoMaxNave):
		spawnNave()
		tempoMax = rand_range(1, 3)
		tempoNave = 0
	
	tempo += delta
	
	if(tempo > tempoMax):
		spawn()
		tempoMax = rand_range(1, 3)
		tempo = 0
	
	#print(pontuacao)
	
	$pontuador.text = "PONTUADOR: " + str(pontuacao)
	
	pass
	
func spawnNave():
	
	
	var naveInimigo = preInimigo2.instance()
	naveInimigo.position = Vector2(rand_range(50, 480), -100)
	add_child(naveInimigo)
	
	pass
	
func spawn():
	
	var inimigo = preInimigo.instance()
	
	inimigo.position = Vector2(rand_range(100, 480), -300)
	inimigo.rotate(5)
	
	add_child(inimigo)
	
	pass


func _on_Button_pressed():
	
	if($tema.playing == false):
		$tema.play()
	
	$tema.stop()
	
	pass # Replace with function body.
