extends Node2D
onready var Global=get_node("/root/Global")
onready var TaxShema=get_node("/root/TaxSchema")
var Tax=preload("res://scenes/TaxInvader.tscn")
var Coin=preload("res://scenes/CoinInvader.tscn")
var timer = 0
var delay = 5
var currentCoin
var y =-10
var evt_index=-1
var navbarShown=false
var start=Vector2(128,430)
var vel=Vector2(0,-100)
var check
# Called when the node enters the scene tree for the first time.
func _ready():
	$Navbar.z_index=100
	$menu.z_index=99
	currentCoin=Coin.instance()
	currentCoin.position=Vector2(128,430)
	get_node("../SpaceInvaders").add_child(currentCoin)
	check=weakref(currentCoin)
	pass # Replace with function body.
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			var eventPose=event.position*0.25
			eventPose.y*=3
			if currentCoin.global_position.distance_to(eventPose)<18:
				evt_index=event.index
		elif evt_index!=-1:
			if evt_index==event.index:
				evt_index=-1
				currentCoin.apply_impulse(Vector2(0,0),vel*3)
	if event is InputEventScreenDrag && evt_index!=-1&&event.index==evt_index:
		var eventPose=event.position*0.25
		eventPose.y*=3
		vel=eventPose-start
		pass
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$TextureProgress.value=Global.city.free_points
	$Label.text=str(Global.avatar.points)
	timer+=delta
	if(!check.get_ref()):
		currentCoin=Coin.instance()
		currentCoin.position=Vector2(128,430)
		get_node("../SpaceInvaders").add_child(currentCoin)
		check=weakref(currentCoin)
	if(timer>=delay):
		timer=0
		var x=randf()*257
		var TaxInstance= Tax.instance()
		TaxInstance.position=Vector2(x,y)
		get_node("../").add_child(TaxInstance)
		y-=50
		delay*=0.9
		if delay<2:
			delay=1
	pass


func _on_DelitionArea_body_entered(body):
	if(body.has_method("delete")):
		body.call("delete")
	pass # Replace with function body.


func _on_ClearArea_body_entered(body):
	if(body.has_method("clear")):
		body.call("clear")
	pass # Replace with function body.


func _on_TextureButton_pressed():
	pass # Replace with function body.


func _on_Button_pressed():
	if(navbarShown):
		get_tree().paused=false
		$AnimationPlayer.play("NavbarHide")
		navbarShown=false
		$Button.visible=false
		$Button2.visible=true
		pass # Replace with function body.


func _on_Button2_pressed():
	pass # Replace with function body.


func _on_Button2_button_down():
	if(!navbarShown):
		get_tree().paused=true
		$AnimationPlayer.play("NavbarShow")
		navbarShown=true
		$Button.visible=true
		$Button2.visible=false
	pass # Replace with function body.
