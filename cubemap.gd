@tool
extends WorldEnvironment

@export var compute: bool:
	get: return false
	set(value): make_cubemap()

func make_cubemap():
	var images = [
		load ('res://Skybox/back.png'),
		load ('res://Skybox/front.png'),
		load ('res://Skybox/left.png'),
		load ('res://Skybox/right.png'),
		load ('res://Skybox/top.png'),
		load ('res://Skybox/bottom.png'),
	]
	
	var cubemap = Cubemap.new()
	cubemap.create_from_images(images)
	ResourceSaver.save(cubemap, 'res://cubemap.tres',
		ResourceSaver.FLAG_COMPRESS)
