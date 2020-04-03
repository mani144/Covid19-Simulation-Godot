extends Control


func _ready() -> void:
	$BackgroundColorRect/Panel/VBoxContainer/OptionButton.add_item("Default",0)
	$BackgroundColorRect/Panel/VBoxContainer/OptionButton.add_item("With Boundaries",1)
	pass


func _on_Button_button_up() -> void:
	var id = $BackgroundColorRect/Panel/VBoxContainer/OptionButton.get_selected_id()
	if id == 0 :
		get_tree().change_scene("res://Map.tscn")
	elif id == 1 :
		get_tree().change_scene("res://MapwithBoundaries.tscn")

