extends CollisionPolygon2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Tax=preload("res://scenes/TaxInvader.tscn")
var timer = 0
var delay = 5
var y =-10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=delta
	if(timer>=delay):
		timer=0
		var x=randf()*257
		var TaxInstance= Tax.instance()
		TaxInstance.position=Vector2(x,y)
		get_node("../").add_child(TaxInstance)
		y-=50
		delay*=0.9
	pass
