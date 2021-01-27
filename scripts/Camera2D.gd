extends Camera2D

export var SCROLL_SPEED = 100
onready var level = get_parent()

func _physics_process(delta):
   position = position.linear_interpolate(level.camera_target, delta * SCROLL_SPEED)

func _ready():
	pass
