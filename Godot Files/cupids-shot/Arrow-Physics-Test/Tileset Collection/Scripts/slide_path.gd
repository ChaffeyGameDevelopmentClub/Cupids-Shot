extends Path2D

@export var loop:bool = false
@export var direction:int = 1
@export var custom_path: Line2D 
@export var speed:float

@onready var path: PathFollow2D = $PathFollow2D

func _ready() -> void:
	path.loop = loop
	for point in custom_path.points:
		curve.add_point(point)


func _process(delta: float) -> void:
	path.progress_ratio+=delta*direction*speed
	if path.progress_ratio == 1 || path.progress_ratio == 0 && !loop:
		direction*=-1
