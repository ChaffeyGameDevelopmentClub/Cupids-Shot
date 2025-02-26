extends Control

# Currently screen is a little big, depends on how ya'll want the game to look tbh.
# Also don't tell anybody but literally everything is stolen lmao

# Vars to manipulate UI through code
@export var LevelSelectPackedScene : PackedScene
@export var LevelSelectContainer : MarginContainer
@export var MenuContainer : MarginContainer
@export var BackButton : Button

# Music
@export var MainMenuMusic : AudioStreamPlayer

# Vars to designate 
var levels_scene
var sub_menu
var animation_state_machine : AnimationNodeStateMachinePlayback
var in_intro

func _ready():
	_setup_select()
	in_intro = true
	$MenuAnimationPlayer.play("Intro")

# Animation Stuff
func intro_done():
	in_intro = false
	$MenuAnimationPlayer.play("OpenMainMenu")

func _event_is_mouse_button_released(event : InputEvent):
	return event is InputEventMouseButton and not event.is_pressed()

func _event_skips_intro(event : InputEvent):
	return event.is_action_released("ui_accept") or \
		event.is_action_released("ui_select") or \
		event.is_action_released("ui_cancel") or \
		_event_is_mouse_button_released(event)

# Hotkey functionality
func _input(event):
	if in_intro and _event_skips_intro(event):
		intro_done()
		return
	if event.is_action_released("ui_cancel"):
		if sub_menu:
			_close_sub_menu()
		else:
			get_tree().quit()

# Sub Menu functionality
func _open_sub_menu(menu : Control):
	sub_menu = menu
	sub_menu.show()
	BackButton.show()
	MenuContainer.hide()

func _close_sub_menu():
	if sub_menu == null:
		return
	sub_menu.hide()
	sub_menu = null
	BackButton.hide()
	MenuContainer.show()

func _on_start_game_pressed() -> void:
	AudioBus.play_sound("UI Long")
	_open_sub_menu(levels_scene)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _setup_select():
	levels_scene = LevelSelectPackedScene.instantiate()
	levels_scene.hide()
	LevelSelectContainer.call_deferred("add_child", levels_scene)

func _on_back_button_pressed() -> void:
	AudioBus.play_sound("UI Short")
	_close_sub_menu()
