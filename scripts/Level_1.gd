extends Node2D
onready var player= $Level_1/Dave

var border = Vector2(100, 100)
var screen_size = Vector2(1280, 608)
var camera_target = Vector2(0, 0)
var current_screen = 1

func update_camera():
	if player.x > current_screen * screen_size.x - border.x:
		current_screen  += 1
	elif player.x < (current_screen - 1) * screen_size.x + border.x:
		current_screen  -= 1
	camera_target.x = current_screen * screen_size.x

func _ready():
	update_camera()
