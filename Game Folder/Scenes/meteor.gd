extends Area2D

# Global speed / rotation / direction
var speed : int
var rotation_speed : int
var direction_x : float
signal collision

func _ready():
	# Generate random starting position / speed / direction for the
	# meteor at spawn point.
	var rng := RandomNumberGenerator.new()
	
	# Start Position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-50)
	position = Vector2(random_x,random_y)
	
	# declaring the variables's values
	speed = rng.randi_range(200,500)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(50,150)
	
	# Random texture for meteor
	# Create a path variable which calls the meteor graphic folder
	var path : String = "res://assests/PNG/Meteors/" + str(rng.randi_range(1,10)) + ".png"
	$Sprite2D.texture = load(path)
# Move meteor down at every frame
func _process(delta):
	position += Vector2(direction_x,1.0) * speed * delta
	rotation_degrees += rotation_speed * delta 

func _on_body_entered(_body: Node2D) -> void:
	collision.emit()

# Destruction of laser and meteor
func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()
