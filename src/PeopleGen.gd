extends Node2D



var sick := preload("res://scenes/Base.tscn")
var Base := preload("res://scenes/Base.tscn")
var totalPeople : int = 99


func _ready() -> void:
	var sick_person := sick.instance()
	sick_person.get_child(0).infected()
	var rand_x_sick : float = rand_range(20,100)
	var rand_y_sick : float = rand_range(20,580)
	sick_person.translate(Vector2(rand_x_sick,rand_y_sick))
	self.add_child(sick_person)
	for _i in range(0, totalPeople): 
		var normal_person := Base.instance()

		var rand_x : float = rand_range(20,1000)
		var rand_y : float = rand_range(20,580)
		normal_person.translate(Vector2(rand_x,rand_y))
		self.add_child(normal_person)
