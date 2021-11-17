
extends Control

var button_index = -1

func _on_OptionButton_item_selected(index):
	button_index = index
	print(button_index)
	
	

func _add_scene(name_scene, index):
	var child_name = load("res://scene/"+name_scene+".tscn").instance()
	$Scene.add_child(child_name)


func _remove_child():
	var children = $Scene.get_children()
	for child in children:
		child.queue_free()
	


func _on_Button_pressed():
	var name_scene = $CanvasLayer/OptionButton.text
	
	if $Scene.get_child_count() == 0:
		_add_scene(name_scene, button_index)
	else: 
		_remove_child()
		_add_scene(name_scene, button_index)
