extends Node2D

signal teleport_to_world(world_position)
signal teleport_to_secret_passage(world_position)

onready var key_sprite = $"Key Sprite"

var can_activate = false

func _process(_delta):
	check_for_activation()

func check_for_activation():
	if can_activate and Input.is_action_just_pressed("interact"):
		activate()

func _on_Activation_Zone_body_entered(_body):
	can_activate = true
	key_sprite.visible = true

func _on_Activation_Zone_body_exited(_body):
	can_activate = false
	key_sprite.visible = false

func activate():
	emit_signal("teleport_to_world", position)
	emit_signal("teleport_to_secret_passage", position)
