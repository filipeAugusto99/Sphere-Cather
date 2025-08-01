extends Node2D

class_name Game

const EXPLODE = preload("res://assets/audio/explode.wav")
const SPHERE = preload("res://Scenes/Sphere/Sphere.tscn")
const MARGIN: float = 70.0

@onready var paddle: Paddle = $Paddle
@onready var spawn_timer: Timer = $SpawnTimer
@onready var background_sound: AudioStreamPlayer = $BackgroundSound
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var score_label: Label = $ScoreLabel

var _score: int = 0
static var _vp_r: Rect2

static func get_vpr() -> Rect2:
	return _vp_r

func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	spawn_spheres()

func update_vp() -> void:
	_vp_r = get_viewport_rect()

func spawn_spheres() -> void:
	
	#Instanciando/criando uma nova cena
	var new_sphere: ourSphere = SPHERE.instantiate()
	
	#definindo a posição que ela será criada
	var x_pos: float = randf_range(
		_vp_r.position.x + MARGIN,
		_vp_r.end.x - MARGIN
	)
	
	new_sphere.position = Vector2(x_pos, -MARGIN)
	new_sphere.sphere_off_screen.connect(_on_sphere_off_screen)
	#adicionando essa cena no jogo
	add_child(new_sphere)

#essa funcao é criada com objetivo de parar o jogo
func stop_all() -> void:
	background_sound.stop()
	background_sound.stream = EXPLODE
	background_sound.play()
	spawn_timer.stop()
	paddle.set_physics_process(false)
	#'get_children' retorna todos os nós filhos de uma cena específica
	for child in get_children():
		if child is ourSphere:
			child.set_physics_process(false)

func _on_paddle_area_entered(area: Area2D) -> void:
	if score_sound.playing == false:
		score_sound.position = area.position
		score_sound.play()
	
	_score += 1
	score_label.text = '%03d' % _score
	
func _on_sphere_off_screen() -> void:
	stop_all()

func _on_timer_timeout() -> void:
	spawn_spheres()
