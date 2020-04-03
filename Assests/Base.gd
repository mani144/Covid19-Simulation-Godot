extends RigidBody2D


var dragging
var drag_start = Vector2()

onready var SICK_TEXTURE  := load("res://Assests/sick.png")
onready var CURED_TEXTURE := load("res://Assests/cured.png")
onready var DEAD_TEXTURE  := load("res://Assests/dead.png")

const NORMAL : int = 0
const SICK   : int = 1 
const CURED  : int = 2 
const DEAD   : int = 3

# 0 normal 1 is for sick 2 for Cured
var state    = NORMAL 

func _ready() -> void:
	randomize()
	var rand_x : float = rand_range(-100,100)
	var rand_y : float = rand_range(-100,100)
	apply_impulse(Vector2(), Vector2(rand_x,rand_y) )



#func _on_Base_body_entered(body):
#	if body.get_name() in 'Base' :
#		if body.state == NORMAL and self.state == SICK :
#			body.infected()
#			body.state= SICK
#	pass # Replace with function body.

func infected() -> void:
	$Sprite.texture = SICK_TEXTURE
	change_state(SICK)
	$CureTimer.autostart = 1
	$CureTimer.start()
	$DeathTimer.start()


#	var enemies = get_tree().get_nodes_in_group("UI")


func change_state(state_num : int) -> void:
	state = state_num


func _on_Base_body_entered(body : Node) -> void:
	if body.get_name() in 'Base' :
		if body.state == NORMAL and self.state == SICK :
			body.infected()
			body.state = SICK
			get_tree().call_group("UI_Commands","increase_sick")



func _on_CureTimer_timeout() -> void:
	change_state(CURED)
	$Sprite.texture = CURED_TEXTURE
	get_tree().call_group("UI_Commands","increase_cured")
	pass 


func _on_DeathTimer_timeout() -> void:
	var random : float = randf()
	if  not state == CURED:
		if random < 0.0036:
			get_tree().call_group("UI_Commands","increase_death")
			$Sprite.texture = DEAD_TEXTURE
			#apply_impulse(Vector2(), Vector2(0,0) )
			$CureTimer.stop()
			$DeathTimer.stop()
