class_name AudioManager
extends Node

var music : AudioStreamPlayer3D
var SFX : AudioStreamPlayer3D
var Rolling : AudioStreamPlayer3D

var marbleImpact : AudioStream = preload("res://Audio/MarbleImpact_1.wav")
var marbleImpact2 : AudioStream = preload("res://Audio/MarbleImpact_2.wav")
var marbleImpact3 : AudioStream = preload("res://Audio/MarbleImpact_3.wav")
var marbleRoll : AudioStream = preload("res://Audio/MarbleRoll_1.wav")
var marbleRoll2 : AudioStream = preload("res://Audio/MarbleRoll_2.wav")
var marbleRoll3 : AudioStream = preload("res://Audio/MarbleRoll_3.wav")
var bgm : AudioStream = preload("res://Audio/MarbleMusic.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	music = $Music
	SFX = $SFX
	Rolling = $Rolling




func play_sfx(soundName : String) -> void:
	match soundName:
		"roll":
			if !Rolling.playing:
				Rolling.stream = marbleRoll2
				Rolling.play()
		"hit":
			SFX.stream = marbleImpact
			SFX.play()
		_:
			return
	
	
func stop_sfx(soundName : String) -> void:
	match soundName:
		"roll":
			Rolling.stop()
		_:
			return
