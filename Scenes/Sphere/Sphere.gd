extends Area2D

#Sinal personalizado / Custom Signal
signal sphere_off_screen

# Define a velocidade que a esfera cai
const SPEED = 200

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	#Esse codigo faz a esfera "cair"
	position.y += SPEED * delta
	
	'''
	get_viewport_rect() é um método que obtém
	os limites da janela de visualização como 
	um retângulo 2 ou rect2
	'''
	
	if position.y > get_viewport_rect().end.y:
		sphere_off_screen.emit()
		die()

func die() -> void:
	set_process(false)
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print('Esfera atingiu a raquete!')
	die()
