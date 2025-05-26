extends Control




func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scene/map test.tscn")
	pass # Replace with function body.


func _on_exitbutton_pressed():
	get_tree().quit()
