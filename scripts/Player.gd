extends KinematicBody2D

export var gravityConstant = 10
var velocity = Vector2.ZERO
export var speed = 45
export var jumpConstant = 130
var is_falling = false

var screen_width:int = 64
var distance : = 1
var cameraSpeed: = 0.3
var new_camera_position
var cameraBound = 0

func _physics_process(delta):
	is_falling = velocity.y>0
	var input = Input.get_axis("move_left","move_right")
	velocity.x = input*speed
	
	if input==1:
		$Sprite.flip_h=false
		if ($Camera2D.get_camera_position().x - self.position.x < 3):
			cameraBound = (self.position.x + distance) * delta * cameraSpeed
			$Camera2D.offset_h = cameraBound
		
	if input==-1:
		$Sprite.flip_h=true
		if ($Camera2D.get_camera_position().x - self.position.x > 3):
			cameraBound = (self.position.x - distance) * delta * cameraSpeed
			$Camera2D.offset_h = cameraBound
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y=-jumpConstant
	if is_falling:
		velocity.y+=gravityConstant*0.1
	else:
		velocity.y+=gravityConstant
	velocity=move_and_slide(velocity,Vector2.UP)
	
	
	
