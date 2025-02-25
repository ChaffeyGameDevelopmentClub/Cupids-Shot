extends Node2D

var arrow_resource = preload("res://Arrow-Physics-Test/Scenes/arrow-test.tscn")

@export var main_camera: Camera2D 
@export var zoomOutSize:Vector2 = Vector2(.5,.5)


#temp
var count = 0
@onready var cupid: AnimatedSprite2D = $AnimatedSprite2D
@onready var lose: Sprite2D = $CanvasLayer/lose
@onready var win: Sprite2D = $CanvasLayer/win


func _process(delta: float) -> void:
	if count==0:
		if Input.is_action_just_pressed("left_click"):
			var zoomTween:Tween = get_tree().create_tween()
			zoomTween.tween_property(main_camera, "zoom", zoomOutSize, 1)
			count+=1
	elif count==1:
		if Input.is_action_just_pressed("left_click"):
			var zoomTween:Tween = get_tree().create_tween()
			zoomTween.tween_property(main_camera, "zoom", Vector2(1,1), 1)
			var posTween:Tween = get_tree().create_tween()
			posTween.tween_property(main_camera, "zoom", Vector2(1,1), 1)
			count+=1
			await posTween.finished
			
			var arrow = arrow_resource.instantiate()
			arrow._launch_arrow(Vector2(150,0))
			arrow.global_position = cupid.global_position
			add_child(arrow)
			arrow.get_child(1).make_current()
	elif count==2:
		if Input.is_action_just_pressed("left_click"): #win
			win.visible = true
			var posTween:Tween = get_tree().create_tween()
			posTween.tween_property(win, "position", Vector2(320, 180), 2)
			count+=1
		if Input.is_action_just_pressed("right_click"): #lose
			lose.visible = true
			var posTween:Tween = get_tree().create_tween()
			posTween.tween_property(lose, "position", Vector2(320, 180), 2)
			count+=1
