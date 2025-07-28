extends Node2D

func _on_paddle_area_entered(area: Area2D) -> void:
	print('Colisao ', area)


func _on_sphere_off_screen() -> void:
	print('Game Over!')
