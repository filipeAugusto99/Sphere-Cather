extends Node2D

const SPHERE = preload("res://Scenes/Sphere/Sphere.tscn")

func _ready() -> void:
	spawn_spheres()

func spawn_spheres() -> void:
	
	#Instanciando/criando uma nova cena
	var new_sphere: ourSphere = SPHERE.instantiate()
	
	#definindo a posição que ela será criada
	var x_pos: float = clampf(
		randf_range(get_viewport_rect().position.x, get_viewport_rect().end.x),
		get_viewport_rect().position.x,
		get_viewport_rect().end.x,
	)
	new_sphere.position = Vector2(x_pos, -50.0)
	new_sphere.sphere_off_screen.connect(_on_sphere_off_screen)
	#adicionando essa cena no jogo
	add_child(new_sphere)
	
func _on_paddle_area_entered(area: Area2D) -> void:
	print('Colisao ', area)

func _on_sphere_off_screen() -> void:
	print('Game Over!')

func _on_timer_timeout() -> void:
	spawn_spheres()
