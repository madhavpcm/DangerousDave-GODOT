extends Camera2D

export var SCROLL_SPEED = 100
onready var player = get_node("/root/Level_1/Dave").position
var screen_size = Vector2(1280,604)
var cur_pos=Vector2()
func _physics_process(delta):
	player=get_node("/root/Level_1/Dave").position
	update_camera()

func _ready():
	set_as_toplevel(true)
	update_camera()

func update_camera():
	#print("cam_position::" ,position.x ,"player_position", player.x)
	if player.x > position.x + screen_size.x/2 :
		position.x += screen_size.x
		print( "camera", position.x )
	elif player.x < position.x - screen_size.x/2:
		position.x -= screen_size.x
		print( position.x )
#no update
