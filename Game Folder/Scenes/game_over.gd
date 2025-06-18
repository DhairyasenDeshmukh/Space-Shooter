extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CanvasLayer/MarginContainer3/Label2.text = $CanvasLayer/MarginContainer3/Label2.text + str(Global.score)
	$GameOverSound.play()

# At the Game over screen. Press space to go back to level scene
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space",true) : get_tree().change_scene_to_file("res://Scenes/level.tscn")
