extends KinematicBody2D

export var gravityConstant = 150;
var velocity:Vector2 = Vector2.ZERO
var direction:Vector2 = Vector2.ZERO
export var speed :int = 30
export var jumpConstant : int = 3000

func _physics_process(delta: float) -> void:
	gravity()
	get_move_vector()
	velocity.x = direction.x * speed
	_jump()
	velocity = move_and_slide(velocity, Vector2.UP)

	

func gravity():
	velocity.y += gravityConstant * get_physics_process_delta_time()
	return velocity.y

func get_move_vector():
	direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	direction.y = -1 if Input.is_action_just_pressed("jump") and is_on_floor() else 1
	return direction

func _jump():
	if(direction.y == -1.0):
		velocity.y = jumpConstant * direction.y * get_physics_process_delta_time()

	
