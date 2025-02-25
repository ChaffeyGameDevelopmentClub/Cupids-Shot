extends Path2D

@export var direction:int = 1
@export var path:PathFollow2D
@export var custom_path: Line2D 
@export var speed:float
@export_enum("Loop", "Bounce", "Locked", "Unlocked") var type:int



func _ready() -> void:
	path.loop = type == 0
	print(path)
	var temp_curve = Curve2D.new()
	for point in custom_path.points:
		temp_curve.add_point(point)
	
	self.curve = temp_curve


func _process(delta: float) -> void:
	if type == 0: #loop
		path.progress_ratio+=delta*direction*speed
	if type == 1: #Bounce
		path.progress_ratio+=delta*direction*speed
		direction *=-1
	if type == 2: #Locked
		pass
	if type == 3: # Unlocked
		path.progress_ratio+=delta*direction*speed
		if path.progress_ratio >= 1 || path.progress_ratio <= 0:
			type = 2
	pass
