extends Node2D

@export var main_cam:Camera2D
@export var zoomOutSize:Vector2 
@export var zoomPosition:Vector2
@export var cupid:Cupid
@export var objective:Objective

var count = 0
var zoomOutPos

func _ready() -> void:
	main_cam.zoom = Vector2(3,3)
	main_cam.position = Vector2(46, 3.5)
	objective.position = Vector2(349, 364)
	objective.visible = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click"):
		if count==0:
			count+=1
			var posTween = get_tree().create_tween()
			posTween.tween_property(objective, "position", Vector2(349, 33), 1)
		elif count ==1:
			zoomOutPos = zoomPosition - main_cam.global_position
			count+=1
			objective.position = Vector2(349, 33)
			var posTween = get_tree().create_tween()
			posTween.tween_property(objective, "position", Vector2(349,364), 1)
			var pos2Tween = get_tree().create_tween()
			pos2Tween.tween_property(main_cam, "position", zoomOutPos, 1)
			var zoomTween = get_tree().create_tween()
			zoomTween.tween_property(main_cam, "zoom", zoomOutSize, 1)
		elif count == 2:
			count+=1
			objective.position = Vector2(349,364)
			main_cam.position = zoomOutPos
			main_cam.zoom = zoomOutSize
			var posTween = get_tree().create_tween()
			posTween.tween_property(main_cam, "position", Vector2(173, 3.5), 1)
			var zoomTween = get_tree().create_tween()
			zoomTween.tween_property(main_cam, "zoom", Vector2(1,1), 1)
		elif count == 3:
			count+=1
			main_cam.position = Vector2(173, 3.5)
			main_cam.zoom = Vector2(1,1)
			cupid.shoot_arrow()
