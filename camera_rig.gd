extends Node3D

@export var target: Node3D

func _process(delta):
	global_position = target.global_position
	
	if Input.is_action_pressed("camera_left"): rotate_y(0.05)
	if Input.is_action_pressed("camera_right"): rotate_y(-0.05)

func get_camera_forward() -> Vector3:
	var camOffsetF = -transform.basis.z
	camOffsetF.y = 0
	return camOffsetF.normalized()
	
func get_camera_right() -> Vector3:
	var camOffsetR = transform.basis.x
	camOffsetR.y = 0
	return camOffsetR.normalized()
