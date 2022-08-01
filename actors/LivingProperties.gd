extends KinematicBody2D
class_name Actor

export var gravity : float   = 50.0
export var speed : Vector2 = Vector2(200.0, 900.0)

var velocity: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
