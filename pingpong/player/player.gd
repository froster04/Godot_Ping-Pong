extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1*speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1*speed
	move_and_slide(velocity)
