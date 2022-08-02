extends KinematicBody2D

export var gravityConstant = 30;
var velocity:Vector2 = Vector2.ZERO
var direction:Vector2 = Vector2.ZERO
export var speed :int = 30

func _physics_process(delta: float) -> void:
	gravity()
	get_move_vector()
	velocity.x = direction.x * speed
	velocity = move_and_slide(velocity)
	

func gravity():
	velocity.y += gravityConstant * get_physics_process_delta_time()
	return velocity.y

func get_move_vector():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = -1 if Input.is_action_just_pressed("jump") and is_on_floor() else 0
	
#	if (direction.x == 0):
#		velocity.x = lerp(0, velocity.x, pow(2,-50 * get_process_delta_time()))
	return direction
