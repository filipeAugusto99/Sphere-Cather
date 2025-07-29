extends Node2D

const SPHERE = preload("res://Scenes/Sphere/Sphere.tscn")
const MARGIN: float = 70.0

@onready var paddle: Paddle = $Paddle
@onready var spawn_timer: Timer = $SpawnTimer

func _ready() -> void:
	spawn_spheres()

func spawn_spheres() -> void:
	
	#Instanciando/criando uma nova cena
	var new_sphere: ourSphere = SPHERE.instantiate()
	
	#definindo a posição que ela será criada
	var x_pos: float = randf_range(
		get_viewport_rect().position.x + MARGIN,
		get_viewport_rect().end.x - MARGIN
	)
	
	new_sphere.position = Vector2(x_pos, -MARGIN)
	new_sphere.sphere_off_screen.connect(_on_sphere_off_screen)
	#adicionando essa cena no jogo
	add_child(new_sphere)

#essa funcao é criada com objetivo de parar o jogo
func stop_all() -> void:
	#parando o timer
	spawn_timer.stop()
	paddle.set_physics_process(false)
	#'get_children' retorna todos os nós filhos de uma cena específica
	for child in get_children():
		if child is ourSphere:
			child.set_process(false)

func _on_paddle_area_entered(area: Area2D) -> void:
	print('Colisao ', area)

func _on_sphere_off_screen() -> void:
	stop_all()

func _on_timer_timeout() -> void:
	spawn_spheres()
