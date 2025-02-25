extends Node2D
@onready var pink: GPUParticles2D = $Pink
@onready var yellow: GPUParticles2D = $Yellow
@onready var blue: GPUParticles2D = $Blue

@onready var expiration: Timer = $Expiration

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pink.restart()
	yellow.restart()
	blue.restart()
	


func _on_expiration_timeout() -> void:
	queue_free()
