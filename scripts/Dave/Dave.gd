extends KinematicBody2D

var velocity = Vector2(0, 0)
var look_direction = Vector2(1,0)
var now =position
const SPEED = 256
const JUMPTHRUST = 256
const JUMPSPEED = 320
const GRAVITY = 480

func _physics_process(delta):
	
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		look_direction = Vector2(1,0)
		$Sprite.play("dave_walk")
		$Sprite.flip_h = false
		#print(is_on_floor())
		
	elif Input.is_action_pressed("left"):
		look_direction = Vector2(-1,0)
		velocity.x = -SPEED
		$Sprite.play("dave_walk")
		$Sprite.flip_h = true

	else:
		$Sprite.play("dave_idle")
	
	
	if not is_on_floor():
		$Sprite.play("dave_jump")
		
	if is_on_floor():
		velocity.y=0
	
	if Input.is_action_just_pressed("jump") and is_on_floor() or Input.is_action_just_released("jump") and is_on_floor():
		now.y = position.y
		velocity.y = -JUMPTHRUST	
		if Input.is_action_pressed("right"):
			velocity.x =JUMPSPEED
		if Input.is_action_pressed("left"):
			velocity.x =-JUMPSPEED	

		
			
	position.y = position.y + velocity.y*delta
	velocity.y = velocity.y + GRAVITY*delta

		
	
			
	if position.y == now.y + 3*64 and not is_on_floor():
		velocity.y = JUMPTHRUST
	
	velocity = move_and_slide(velocity, Vector2.UP )
	
	velocity.x = lerp(velocity.x , 0 , 0.5)
	#print("player side" ,position.x ,position.y)


func _on_Area2D_body_entered(body):
	#reset position and lives here
	
	get_tree().change_scene("res://scenes/Level_2.tscn")
	 # Replace with function body.
