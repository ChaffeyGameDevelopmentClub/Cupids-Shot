extends Node2D

#Check the sides because we are using some built in linear damp and angular damp and gravity over time for this function

#We're basically cheating by rotating the area 2d body to simulate arrow movement
@onready var arrow: Area2D = $Area2D
@onready var bounce_timer: Timer = $"Bounce Timer"



#Lol what do you think this is for
var true_velocity = Vector2(0,0)
@export var custom_gravity : float = 40
var acceleration : Vector2


var just_bounced:bool = false

#Two states really - arrowAiming is going to be probably for aiming but right now we're just trying to get the physics right
var arrowLaunched = false

var gliding = false
var pointing_to = Vector2.ZERO

var stuck = false

var directional_influence = .5

#OK THIS MIGHT BE COOL
var fuel : float = 100
var boost :Vector2


#Can work on the physics for this later, it's pretty weak feeling right now
func _process(delta: float) -> void:
	if arrowLaunched && !stuck:
		
		if true_velocity.y>=0:
			true_velocity +=  (arrow.gravity_direction * custom_gravity*1.5) * delta
		if true_velocity.y<=0:
			true_velocity +=  (arrow.gravity_direction * custom_gravity) * delta
		var input_dir = Input.get_axis("ui_right", "ui_left")
		true_velocity += input_dir * true_velocity.normalized().orthogonal()
		position +=  true_velocity * delta
		rotation = true_velocity.angle() 
		
		'''
		if true_velocity.x > 0 && fuel > 10:
			#true_velocity.x.clamp(0,true_velocity.x)
			if Input.is_action_pressed("ui_left"):
				#Scuffed, really bad,
				#Almost works though but spent too long on it
				rotation = lerp(rotation,deg_to_rad(100),.1)
				fuel -= .5
				var temp_vel = true_velocity
				true_velocity = lerp(temp_vel, boost,.5)
				true_velocity.y -= .2
				true_velocity -= Vector2(10,0)
			elif Input.is_action_pressed("ui_right"):
				true_velocity.x -= .7
				boost = Vector2(200,0) + true_velocity
				
		elif true_velocity.x < 0 && fuel > 10:
			#true_velocity.x.clamp(true_velocity.x,0)
			if Input.is_action_pressed("ui_left"):
				true_velocity += Vector2(.2, -.01)
			elif Input.is_action_pressed("ui_right"):
				true_velocity += Vector2(-.1, .4)
		'''


#run this when the state is changed
func _launch_arrow(initial_velocity: Vector2) -> void:
	arrowLaunched = true
	print(initial_velocity)
	true_velocity = initial_velocity
	pass

func Bounce_x() -> void:
	if (!just_bounced):
		just_bounced = true
		bounce_timer.start()
		true_velocity = true_velocity.bounce(Vector2(1,0))
		position+=true_velocity.normalized()*25

func Bounce_y() -> void:
	if (!just_bounced):
		just_bounced = true
		bounce_timer.start()
		true_velocity = true_velocity.bounce(Vector2(0,1))
		position+=true_velocity.normalized()*25


func _on_bounce_timer_timeout() -> void:
	just_bounced = false
