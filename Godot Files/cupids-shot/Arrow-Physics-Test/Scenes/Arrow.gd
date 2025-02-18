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


#The logic we can use for the arrow is force (vector) is equal to the mass and then the acceleration (also a vector)
#We can use it to update the position so like position += force
#We are NOT accounting for wind resistance, yet


#Can work on the physics for this later, it's pretty weak feeling right now
func _process(delta: float) -> void:
	if arrowLaunched && !stuck:
		true_velocity +=  gravity_direction * gravity #Can use custom gravity, will change it later
		position +=  true_velocity * delta
		rotation = true_velocity.angle()
		
		pass
	pass

#run this when the state is changed
func _launch_arrow(initial_velocity: Vector2) -> void:
	arrowLaunched = true
	true_velocity = initial_velocity
	pass




func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is TileMapLayer:
		process_tile(body, body_rid)


func process_tile(tile:TileMapLayer, body_rid:RID):
	var collided_coords = tile.get_coords_for_body_rid(body_rid)
	
	var tile_data = tile.get_cell_tile_data(collided_coords)
	
	var can_ricochet:bool = tile_data.get_custom_data_by_layer_id(0)
	
	
	
	if can_ricochet:
		true_velocity = true_velocity.bounce(Vector2(1,0))
		position+= true_velocity.normalized()*50
		print("goodbye loser")
	else:
		stuck = true
		print("help, Im stuck")
