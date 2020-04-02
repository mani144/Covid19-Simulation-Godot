extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sick = preload("res://Assests/Base.tscn")
var Base = preload("res://Assests/Base.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var sick_person = sick.instance()
	sick_person.get_child(0).infected()
	var rand_x_sick = rand_range(20,100)
	var rand_y_sick = rand_range(20,580)
	sick_person.translate(Vector2(rand_x_sick,rand_y_sick))
	self.add_child(sick_person)
	for _i in range(0,99):
		var normal_person = Base.instance()

		var rand_x = rand_range(20,1000)
		var rand_y = rand_range(20,580)
		normal_person.translate(Vector2(rand_x,rand_y))
		self.add_child(normal_person)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
