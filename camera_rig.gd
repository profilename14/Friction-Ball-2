extends Node3D

@export var target: Node3D

func _process(delta):
	global_position = target.global_position
	
	if Input.is_action_pressed("camera_left"): rotate_y(0.05)
	if Input.is_action_pressed("camera_right"): rotate_y(-0.05)
