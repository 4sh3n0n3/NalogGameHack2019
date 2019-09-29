extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
onready var Global=get_node("/root/Global")
var is_my
func delete():
	Global.city.free_points+=100
	if is_my:
		Global.avatar.points+=100
	else:
		Global.avatar.points-=50
	queue_free()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
