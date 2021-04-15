extends Node2D

onready var world = $World
onready var ground_floor = $"World/Ground Floor"
onready var basement = $World/Basement
onready var player = $Player

var removed_node

func _ready():
	removed_node = basement
	world.remove_child(basement)

func _on_Trapdoor_teleport_to_secret_passage(world_position):
	player.can_move = false
	teleport(ground_floor)
	player.can_move = true

func _on_Trapdoor_teleport_to_world(world_position):
	player.can_move = false
	teleport(basement)
	player.can_move = true

func teleport(from):
	var node_to_add = removed_node
	removed_node = from
	world.remove_child(removed_node)
	world.add_child(node_to_add)
