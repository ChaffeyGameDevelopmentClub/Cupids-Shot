extends Area2D


#Check the sides because we are using some built in linear damp and angular damp and gravity over time for this function

#We're basically cheating by rotating the area 2d body to simulate arrow movement
@onready var arrow: Area2D = $"."
@onready var tip: CollisionPolygon2D = $Tip
@onready var arrow_sprite: Sprite2D = $"Arrow Sprite"

#Lol what do you think this is for
var true_velocity = Vector2(0,0)
@export var custom_gravity : float 
@export var mass : float #Assume kg
var acceleration : Vector2


#Two states really - arrowAiming is going to be probably for aiming but right now we're just trying to get the physics right
var arrowLaunched = false
var arrowAiming = true


#The logic we can use for the arrow is force (vector) is equal to the mass and then the acceleration (also a vector)
#We can use it to update the position so like position += force
#We are NOT accounting for wind resistance, yet


#Can work on the physics for this later, it's pretty weak feeling right now
func _process(delta: float) -> void:
	if arrowLaunched:
		true_velocity +=  gravity_direction * mass * gravity #Can use custom gravity, will change it later
		position +=  true_velocity * delta
		rotation = true_velocity.angle()
		
		pass
	pass

#run this when the state is changed
func _launch_arrow(initial_velocity: Vector2) -> void:
	arrowLaunched = true
	true_velocity = initial_velocity
	pass
