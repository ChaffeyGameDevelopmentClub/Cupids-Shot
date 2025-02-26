extends CanvasLayer


@onready var win: Sprite2D = $Win
@onready var lose: Sprite2D = $Lose

func Lose():
	AudioBus.play_sound("You Lose")
	lose.visible = true
	var posTween:Tween = get_tree().create_tween()
	posTween.tween_property(lose, "position", Vector2(320, 180), 2)

func Win():
	AudioBus.play_sound("You Win")
	win.visible = true
	var posTween:Tween = get_tree().create_tween()
	posTween.tween_property(win, "position", Vector2(320, 180), 2)
