extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@onready var balloon_normal: Sprite2D = $"Balloon Normal"
@onready var balloon_popped: AnimatedSprite2D = $BalloonPopped
const BLUE_BALLOON = preload("res://Touch ups/New Super Balloon Tileset/Sprites/blue-balloon.png")
const CYAN_BALLOON = preload("res://Touch ups/New Super Balloon Tileset/Sprites/cyan-balloon.png")
const GREEN_BALLOON = preload("res://Touch ups/New Super Balloon Tileset/Sprites/green-balloon.png")
const MAGENTA_BALLOON = preload("res://Touch ups/New Super Balloon Tileset/Sprites/magenta-balloon.png")
const SPRITE_0001 = preload("res://Touch ups/New Super Balloon Tileset/Sprites/Sprite-0001.png")

var balloon_type : Sprite2D
const CONFETTI_PARTICLES = preload("res://Sprites-And-Stuff/Scenes/Confetti/Confetti Particles.tscn")

func _ready() -> void:
	var color = randi_range(1,5)
	if color == 1:
		balloon_normal.texture = SPRITE_0001
	if color == 2:
		balloon_normal.texture = BLUE_BALLOON
	if color == 3:
		balloon_normal.texture = CYAN_BALLOON
	if color == 4:
		balloon_normal.texture = MAGENTA_BALLOON
	if color == 5:
		balloon_normal.texture = GREEN_BALLOON
		
func BalloonPop() -> void:
	balloon_normal.visible = false
	AudioBus.play_sound("Balloon Pop")
	balloon_popped.visible = true
	balloon_popped.play("popped")
	collision_shape_2d.queue_free()
	var new_confetti_spawn = CONFETTI_PARTICLES.instantiate()
	new_confetti_spawn.position = position
	get_parent().add_child(new_confetti_spawn)
	await(balloon_popped.animation_looped)
	balloon_popped.hide()
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("heygafyusgdf")
	if area.is_in_group("arrow"):
		var arrow = area.get_parent()
		var dir = global_position - arrow.global_position;
		arrow.true_velocity = arrow.true_velocity.bounce(dir.normalized())
		BalloonPop()
