extends CanvasLayer

onready var room_name_label = $"VBoxContainer/CenterContainer/Room Name"

func _on_Room_Zone_room_entered(room_name):
	room_name_label.text = room_name

func _on_Room_Zone_room_exited():
	room_name_label.text = ""
