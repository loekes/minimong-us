extends Area2D

export var room_name: String

signal room_entered(room_name)
signal room_exited

func _on_Room_Zone_body_entered(_body):
	emit_signal("room_entered", room_name)

func _on_Room_Zone_body_exited(_body):
	emit_signal("room_exited")
