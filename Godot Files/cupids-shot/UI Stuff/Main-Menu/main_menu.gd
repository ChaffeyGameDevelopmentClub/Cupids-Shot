extends Control

# Currently screen is a little big, depends on how ya'll want the game to look tbh.
# Also don't tell anybody but literally everything is stolen lmao

# Vars to manipulate UI through code
@export var LevelSelectPackedScene : PackedScene
@export var LevelSelectContainer : MarginContainer
@export var MenuContainer : MarginContainer
@export var BackButton : Button

# Label shit, might not need in the future anyways if we draw our logo
@export var TitleLabel: Label

# Vars to designate 
var levels_scene
var sub_menu

func _ready() -> void:
	_setup_select()

func _process(delta: float) -> void:
	pass

# Hotkey functionality
func _input(event):
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
	_open_sub_menu(levels_scene)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _setup_select():
	levels_scene = LevelSelectPackedScene.instantiate()
	levels_scene.hide()
	LevelSelectContainer.call_deferred("add_child", levels_scene)

func _on_back_button_pressed() -> void:
	_close_sub_menu()
