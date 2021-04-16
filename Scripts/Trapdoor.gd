extends Node2D

signal teleport_to_world
signal teleport_to_secret_passage

onready var key_sprite = $"Key Sprite"

var can_activate = false

var allowed_roles = [GameData.Role.Assassin]

func _process(_delta):
	check_for_activation()

func check_for_activation():
	if can_activate and Input.is_action_just_pressed("interact"):
		activate()

func _on_Activation_Zone_entered():
		can_activate = true
		key_sprite.visible = true

func _on_Activation_Zone_exited():
		can_activate = false
		key_sprite.visible = false

func activate():
	emit_signal("teleport_to_world")
	emit_signal("teleport_to_secret_passage")
