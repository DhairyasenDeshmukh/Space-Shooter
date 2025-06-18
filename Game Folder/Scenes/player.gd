extends CharacterBody2D

@export var speed: int = 1000 # Declared a global variable called speed set to 400 value.
signal laser(pos)

func _ready() -> void:# Called when the node enters the scene tree for the first time.
	position = Vector2(600,650) # Starting position of the ship.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed # Inbuilt uses delta
	move_and_slide()
	
	# Shoot input
	if Input.is_action_just_pressed("shoot") : 
		laser.emit($LaserSpawnPoint.global_position)
		$LaserSound.play()
	
func damage_sound():
	$DamageSound.play()
