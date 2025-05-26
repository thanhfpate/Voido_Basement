extends Control




func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/map2.tscn")



func _on_exitbutton_pressed():
	get_tree().quit()
	pass # Replace with function body.
