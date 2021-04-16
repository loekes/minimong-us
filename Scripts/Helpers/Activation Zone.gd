extends Area2D

export(Array, GameData.Role) var allowed_roles 

signal entered
signal exited

func _on_Activation_Zone_body_entered(body):
	if body.name == "Player" and allowed_roles.has(body.ROLE):
		emit_signal("entered")
	elif allowed_roles.size() == 0:
		emit_signal("entered")

func _on_Activation_Zone_body_exited(_body):
	emit_signal("exited")
