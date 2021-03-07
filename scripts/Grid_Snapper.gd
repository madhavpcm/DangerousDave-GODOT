extends Position2D

var m_position = get_parent().position

func _physics_process(delta):
	print("inside position 2d", m_position," : x :", position)
