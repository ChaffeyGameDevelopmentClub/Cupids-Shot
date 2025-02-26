extends Node

@onready var music_bus: AudioStreamPlayer = $Music
@onready var sound_bus: AudioStreamPlayer = $"Sound Effects"

var BGMusic = preload("res://Sound & Music/Game BGM.wav")
var MenuMusic = preload("res://Sound & Music/Menu Theme.wav")

var soundsList:Dictionary = {
	"Arrow Charge":preload("res://Sound & Music/Arrow Charge.wav"),
	"Arrow Fail":preload("res://Sound & Music/Arrow Fail.wav"),
	"Arrow Success":preload("res://Sound & Music/Arrow Success.wav"),
	"Arrow Ricochet":preload("res://Sound & Music/Arrow Ricochet.wav"),
	"Arrow Shoot":preload("res://Sound & Music/Arrow Shoot.wav"),
	"Balloon Pop":preload("res://Sound & Music/Balloon Pop.wav"),
	"Charge Loop":preload("res://Sound & Music/Charge Loop.wav"),
	"Glass Break":preload("res://Sound & Music/Glass Break.wav"),
	"UI Long":preload("res://Sound & Music/UI Long.wav"),
	"UI Short":preload("res://Sound & Music/UI Short.wav"),
	"You Lose":preload("res://Sound & Music/You Lose.wav"),
	"You Win":preload("res://Sound & Music/You Win.wav")
}


func play_sound(sound:String):
	if sound in soundsList:
		sound_bus.stop()
		sound_bus.stream = soundsList[sound]
		sound_bus.play()
	else:
		print("Sound not in soundslist")

func play_music(music:String):
	if music == "BGM":
		music_bus.stop()
		music_bus.stream = BGMusic
		music_bus.play()
	if music == "Menu":
		music_bus.stop()
		music_bus.stream = MenuMusic
		music_bus.play()

func music_transition(volume:float, duration:float):
	var volumeTween = get_tree().create_tween()
	volumeTween.tween_property(music_bus, "volume_db", volume, duration)

func _on_music_finished() -> void:
	music_bus.play()

func _on_sound_effects_finished() -> void:
	if sound_bus.stream == soundsList["Arrow Charge"] || sound_bus.stream == soundsList["Charge Loop"]:
		sound_bus.stream = soundsList["Charge Loop"]
		sound_bus.play()
