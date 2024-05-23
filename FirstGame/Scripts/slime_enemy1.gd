extends CharacterBody2D

# Speed at which the slime moves
const SPEED = 20

func _physics_process(_delta):
	# Get the direction towards the player character
	var direction = (get_parent().get_node("Player").global_position - global_position).normalized()
	
	velocity = direction * SPEED
	move_and_slide()
