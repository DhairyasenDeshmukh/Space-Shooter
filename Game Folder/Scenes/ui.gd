extends CanvasLayer

var health_icon = load("res://assests/PNG/UI/playerLife2_orange.png")

var time_elapsed:= 0

func set_health(amount):
	# remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	# create new children amount is set by health
	for i in amount:
		var text_rect  = TextureRect.new()
		text_rect.texture = health_icon
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$MarginContainer1/Label.text = str(time_elapsed)
	Global.score = time_elapsed
