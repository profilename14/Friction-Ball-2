extends RigidBody3D

@export var rollAcceleration := 5
@export var maxRollVelocity := 8
@export var jumpPower := 3

@export var accelMultiplier := 1.0
@export var velMultiplier := 1.0


func _ready() -> void:
	pass 
	
func _physics_process(delta):
	var direction = Vector3.ZERO
	print(accelMultiplier)
	
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		
		
	if Input.is_action_pressed("ui_accept") and on_floor:
		apply_impulse(Vector3.UP * jumpPower)

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
		if linear_velocity.length() < maxRollVelocity * velMultiplier:
			var torque = Vector3(direction.z, 0, -direction.x)
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
