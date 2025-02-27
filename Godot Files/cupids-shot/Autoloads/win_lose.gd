extends CanvasLayer


@onready var win: Sprite2D = $Win
@onready var lose: Sprite2D = $Lose

@onready var lose_screen: Control = $"Lose Screen"
@onready var win_screen: Control = $"Win Screen"

func Lose():
	AudioBus.play_sound("You Lose")
	lose.visible = true
	var posTween:Tween = get_tree().create_tween()
	posTween.tween_property(lose, "position", Vector2(320, 192), 3)
	lose_screen.visible = true
	posTween.tween_property(lose_screen, "position", Vector2(0,0), 1)

func Win():
	AudioBus.play_sound("You Win")
	win.visible = true
	var posTween:Tween = get_tree().create_tween()
	posTween.tween_property(win, "position", Vector2(320, 198), 3)
	win_screen.visible = true
	posTween.tween_property(win_screen, "position", Vector2(0,0), 1)

func reset():
	win.position = Vector2(320, 540)
	lose.position = Vector2(320, 540)
	win_screen.position = Vector2(0,360)
	lose_screen.position = Vector2(0,360)
