extends Node2D
@export var menu_screen: Node2D
@export var popup: Node2D
func toggle_visiblity(object):
	if object.visible:
		object.visible = false
	else:
		object.visible = true
	

func _on_open_menu_pressed():
	toggle_visiblity(menu_screen)
	toggle_visiblity(popup)


func _on_button_pressed():
	toggle_visiblity(menu_screen)
	toggle_visiblity(popup)


func _on_inventory_button_pressed():
	get_tree().change_scene_to_file("res://Scene/inv_ui.tscn")
