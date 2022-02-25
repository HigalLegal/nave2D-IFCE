extends AnimatedSprite


func _ready():
	play("explosao")
	pass

func _on_AnimatedSprite_animation_finished():
	queue_free()
	pass # Replace with function body.
