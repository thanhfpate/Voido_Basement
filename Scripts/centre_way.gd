extends Area2D

var entered = false



func _on_body_entered(body):
	entered = true
	pass # Replace with function body.


func _process(delta):
	if entered == true:
		get_tree().change_scene_to_file("res://Scene/citadel centre.tscn")

pass
