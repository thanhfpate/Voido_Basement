extends Control




func _on_playbutton_pressed():
	get_tree().change_scene_to_file("res://Scene/map test.tscn")




func _on_exitbutton_pressed():
	get_tree().quit()
