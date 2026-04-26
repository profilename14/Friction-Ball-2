extends Area3D

@export var accelMultiplier := 1.0
@export var velMultiplier := 1.0

func _on_body_entered(body):
	#print("Baba")
	if body.has_method("set_surface_modifiers"):
		body.set_surface_modifiers(accelMultiplier, velMultiplier)

func _on_body_exited(body):
	print("scu")
	if body.has_method("reset_surface_modifiers"):
		body.reset_surface_modifiers()
