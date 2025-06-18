extends Area2D

@export var speed : int = 1500

func _process(delta: float) -> void:
	position += Vector2(0,-1.0) * speed * delta
