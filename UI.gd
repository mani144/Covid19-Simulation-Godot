extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().get_node("PeopleGen").get_children()
	pass # Replace with function body.


func increase_death():
	$Panel/GridContainer/DLabelN.text = str(int($Panel/GridContainer/DLabelN.text) + 1)
	$Panel/GridContainer/SLabelN.text = str(int($Panel/GridContainer/SLabelN.text) - 1)
func increase_cured():
	$Panel/GridContainer/CLabelN.text = str(int($Panel/GridContainer/CLabelN.text) + 1)
	$Panel/GridContainer/SLabelN.text = str(int($Panel/GridContainer/SLabelN.text) - 1)
func increase_sick():
	$Panel/GridContainer/SLabelN.text = str(int($Panel/GridContainer/SLabelN.text) + 1)
	$Panel/GridContainer/NLabelN.text = str(int($Panel/GridContainer/NLabelN.text) - 1)

