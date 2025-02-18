extends Area2D

#Check the sides because we are using some built in linear damp and angular damp and gravity over time for this function

#We're basically cheating by rotating the area 2d body to simulate arrow movement
@onready var arrow: Area2D = $"."
@onready var arrow_sprite: Sprite2D = $"Arrow Sprite"
@onready var tip: CollisionPolygon2D = $Tip



#Lol what do you think this is for
var true_velocity = Vector2(0,0)
@export var custom_gravity : float 
@export var mass : float #Assume kg
var acceleration : Vector2


#Two states really - arrowAiming is going to be probably for aiming but right now we're just trying to get the physics right
var arrowLaunched = false

var stuck = false

var directional_influence = Vector2.ZERO

#Can work on the physics for this later, it's pretty weak feeling right now
func _process(delta: float) -> void:
	if arrowLaunched && !stuck:
		true_velocity +=  gravity_direction * gravity
		position +=  true_velocity * delta
		rotation = true_velocity.angle()
		if true_velocity.x > 0:
			print("This way") #Right
		elif true_velocity.x < 0:
			print("That way") #Left
		pass
	pass

#run this when the state is changed
func _launch_arrow(initial_velocity: Vector2) -> void:
	arrowLaunched = true
	true_velocity = initial_velocity
	pass
	
func Bounce_x() -> void:
	true_velocity = true_velocity.bounce(Vector2(1,0))

func Bounce_y() -> void:
	true_velocity = true_velocity.bounce(Vector2(0,1))
