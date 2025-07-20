extends Area2D

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
		print('Esfera saiu da tela!')
		
		#Desliga o processamento da funcao _physics_process() 
		set_process(false)
		#Deleta a esfera do jogo
		queue_free()
	
