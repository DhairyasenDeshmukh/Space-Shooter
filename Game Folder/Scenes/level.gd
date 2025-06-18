extends Node2D
# 1. Load the scene
var meteor_scene : PackedScene = load("res://Scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://Scenes/laser.tscn")

var health: int = 5

func ready():
	$GameMusic.play()

func _on_timer_timeout() -> void:
	# 2. Create an Instance
	var meteor = meteor_scene.instantiate()
	
	# 3. Attach the node to the scene tree.
	$Meteors.add_child(meteor)
	
	# Connect Signal
	meteor.connect("collision", _on_meteor_collision)
	

func _on_meteor_collision():
	$Player.damage_sound()
	health -= 1
	get_tree().call_group("UI","set_health",health)
	if health <=0 : 
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")

func _on_player_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
