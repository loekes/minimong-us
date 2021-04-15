extends StaticBody2D

export var time_open = 5

onready var anim_player = $AnimationPlayer
onready var collider = $CollisionShape2D
onready var timer = $Timer
onready var key_sprite = $"Key Sprite"

var can_activate = false
var is_open = false

func _ready():
	key_sprite.rotation = -self.rotation

func _process(_delta):
	check_for_activation()

func _on_Activation_Zone_body_entered(_body):
	if(!is_open):
		key_sprite.visible = true
	can_activate = true

func _on_Activation_Zone_body_exited(_body):
	can_activate = false
	key_sprite.visible = false

func check_for_activation():
	if can_activate and Input.is_action_just_pressed("interact"):
		activate()

func activate():
	anim_player.play("DoorOpen")
	is_open = true
	can_activate = false
	key_sprite.visible = false
	collider.set_disabled(true)
	timer.start(time_open)

func deactivate():
	anim_player.play("DoorClose")
	is_open = false
	collider.set_disabled(false)
	timer.stop()

func _on_Timer_timeout():
	deactivate()
