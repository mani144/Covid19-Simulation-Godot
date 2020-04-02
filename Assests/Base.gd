extends RigidBody2D


var dragging
var drag_start = Vector2()

var NORMAL = 0
var SICK = 1 
var CURED = 2 
var DEAD = 3
var state = NORMAL # 0 normal 1 is for sick 2 for Cured
func _ready():
	randomize()
	var rand_x = rand_range(-100,100)
	var rand_y = rand_range(-100,100)
	apply_impulse(Vector2(), Vector2(rand_x,rand_y) )



#func _on_Base_body_entered(body):
#	if body.get_name() in 'Base' :
#		if body.state == NORMAL and self.state == SICK :
#			body.infected()
#			body.state= SICK
#	pass # Replace with function body.

func infected():
	$Sprite.texture = load("res://Assests/sick.png")
	change_state(SICK)
	$CureTimer.autostart = 1
	$CureTimer.start()
	$DeathTimer.start()


#	var enemies = get_tree().get_nodes_in_group("UI")


func change_state(state_num):
	state = state_num


func _on_Base_body_entered(body):
	if body.get_name() in 'Base' :
		if body.state == NORMAL and self.state == SICK :
			body.infected()
			body.state= SICK
			get_tree().call_group("UI_Commands","increase_sick")
	pass # Replace with function body.


func _on_CureTimer_timeout():
	change_state(CURED)
	$Sprite.texture = load("res://Assests/cured.png")
	get_tree().call_group("UI_Commands","increase_cured")
	pass # Replace with function body.


func _on_DeathTimer_timeout():
	var random = randf()
	if  not state == CURED:
		if random < 0.0036:
			get_tree().call_group("UI_Commands","increase_death")
			$Sprite.texture = load("res://Assests/dead.png")
#			apply_impulse(Vector2(), Vector2(0,0) )
			$CureTimer.stop()
			$DeathTimer.stop()
	pass # Replace with function body.
