extends Control
@onready var objective: Control = $"."

@onready var picture: TextureRect = $TextureRect/Picture
@onready var description: Label = $TextureRect/Description
@onready var name_t: Label = $TextureRect/NameT


@export var Target : target_slot
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	picture.texture = Target.target_name.target_image
	description.text = "%s" % [Target.target_name.target_description]
	name_t.text = "%s" % [Target.target_name.target_name]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click"):
		objective.hide()
	pass
#character_portrait.texture = dialogue.dialogue_tree[currpage].dialogue_data.dialogue_portrait
#	text.text = "%s" % [dialogue.dialogue_tree[currpage].dialogue_data.dialogue_sentence]
#	character_name.text = "%s" % [dialogue.dialogue_tree[currpage].dialogue_data.dialgoue_name]
