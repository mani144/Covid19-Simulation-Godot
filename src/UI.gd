extends Control


func _ready() -> void:
	get_parent().get_node("PeopleGen").get_children()


func increase_death() -> void:
	$Panel/GridContainer/DLabelN.text = str(int($Panel/GridContainer/DLabelN.text) + 1)
	$Panel/GridContainer/SLabelN.text = str(int($Panel/GridContainer/SLabelN.text) - 1)

func increase_cured() -> void:
	$Panel/GridContainer/CLabelN.text = str(int($Panel/GridContainer/CLabelN.text) + 1)
	$Panel/GridContainer/SLabelN.text = str(int($Panel/GridContainer/SLabelN.text) - 1)
	
func increase_sick() -> void:
	$Panel/GridContainer/SLabelN.text = str(int($Panel/GridContainer/SLabelN.text) + 1)
	$Panel/GridContainer/NLabelN.text = str(int($Panel/GridContainer/NLabelN.text) - 1)

