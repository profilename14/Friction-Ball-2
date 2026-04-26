extends RigidBody3D

@export var rollAcceleration := 5
@export var maxRollVelocity := 8
@export var jumpPower := 3

@export var accelMultiplier := 1.0
@export var velMultiplier := 1.0

@export var camera: Node3D

var startPos

func _ready() -> void:
	startPos = transform.origin
	
func _physics_process(delta):
	if camera == null:
		return
		
	var direction = Vector2.ZERO
	#print(accelMultiplier)
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x += 1
	if Input.is_action_pressed("ui_right"):
		direction.x -= 1
		
		
	if Input.is_action_pressed("ui_accept") and on_floor:
		apply_impulse(Vector3.UP * jumpPower)

	if direction != Vector2.ZERO:
		direction = direction.y * camera.get_camera_forward() +  direction.x * camera.get_camera_right()
		if direction.length() > 1:
			direction = direction.normalized()
		
		if linear_velocity.length() < maxRollVelocity * velMultiplier:
			var torque = direction.cross(Vector3.UP)
			apply_torque(torque * rollAcceleration * accelMultiplier)
			
			
			
var on_floor: bool = false

# override default version of this function to check if grounded
func _integrate_forces(state: PhysicsDirectBodyState3D) -> void:
	on_floor = false 

	var i := 0
	while i < state.get_contact_count():
		var normal := state.get_contact_local_normal(i)
		var this_contact_on_floor = normal.dot(Vector3.UP) > 0.99

		on_floor = on_floor or this_contact_on_floor
		i += 1
		
		
func set_surface_modifiers(accel, speed):
	accelMultiplier = accel
	velMultiplier = speed

func reset_surface_modifiers():
	pass
	#accelMultiplier = 1.0
	#velMultiplier = 1.0
	
func restart():
	transform.origin = startPos
	linear_velocity = Vector3.ZERO
