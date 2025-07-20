extends Area2D

const SPEED: int = 200

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	#faz a nuvem se mover para a esquerda ao apertar A
	if Input.is_action_pressed('left') == true:
		position.x -= SPEED * delta
	
	#faz a nuvem se mover para a direta ao apertar D
	elif Input.is_action_pressed('right') == true:
		position.x += SPEED * delta
