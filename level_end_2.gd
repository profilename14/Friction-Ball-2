extends Area3D


func _on_body_entered(body):
	if body.has_method("restart"):
		get_tree().change_scene_to_file("res://Level 3.tscn")
