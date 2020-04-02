extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$BackgroundColorRect/Panel/VBoxContainer/OptionButton.add_item("Default",0)
	$BackgroundColorRect/Panel/VBoxContainer/OptionButton.add_item("With Boundaries",1)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	var id = $BackgroundColorRect/Panel/VBoxContainer/OptionButton.get_selected_id()
	if id == 0 :
		get_tree().change_scene("res://Map.tscn")
	elif id == 1 :
		get_tree().change_scene("res://MapwithBoundaries.tscn")

