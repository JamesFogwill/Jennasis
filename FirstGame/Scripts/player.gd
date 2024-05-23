extends CharacterBody2D

@export var speed : float = 100

# underscore represents unused variable
func _physics_process(_delta):
	# get input direction
	var input_direction = Vector2(
		# if u have both pressed the net direction is 0 due to the minus
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
		
	)
	# update velocity
	velocity = input_direction * speed
	if input_direction.x != 0:
		$AnimatedSprite2D.play("right_left")
		if input_direction.x > 0:
			$AnimatedSprite2D.flip_h = false  # Face right
		elif input_direction.x < 0:
			$AnimatedSprite2D.flip_h = true  # Face left
	elif input_direction.y > 0:
		$AnimatedSprite2D.play("down")
	elif input_direction.y < 0:
		$AnimatedSprite2D.play("up") 
			
	if input_direction.x == 0 and input_direction.y == 0:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
