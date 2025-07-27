extends Area2D

const SPEED: int = 200

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	
	#Outra forma com menos codigo para mover o paddle
	var movement: float = Input.get_axis('left', 'right')
	position.x += SPEED * delta * movement
	
	#delimita a area que o paddle pode se mover
	position.x = clampf(
		position.x,
		get_viewport_rect().position.x,
		get_viewport_rect().end.x
	)

func _on_area_entered(area: Area2D) -> void:
	print('Algo colidiu com a raquete!')
