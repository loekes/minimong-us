extends Node2D

onready var world = $World
onready var ground_floor = $"World/Ground Floor"
onready var basement = $World/Basement
onready var player = $Player
onready var transition_player = $"UI/Circle Transition/AnimationPlayer"

var removed_node

func _ready():
	removed_node = basement
	world.remove_child(basement)

func _on_Trapdoor_teleport_to_secret_passage():
	player.can_move = false
	teleport(ground_floor)
	player.can_move = true

func _on_Trapdoor_teleport_to_world():
	player.can_move = false
	teleport(basement)
	player.can_move = true

func teleport(from):
	var node_to_add = removed_node
	removed_node = from
	
	transition_player.play("close")
	yield(transition_player, "animation_finished")
	
	world.remove_child(removed_node)
	world.add_child(node_to_add)
	
	transition_player.play("open")
	yield(transition_player, "animation_finished")