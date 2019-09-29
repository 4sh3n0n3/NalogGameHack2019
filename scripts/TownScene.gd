extends Node2D
var navbarShown=false

#var evt_index=-1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if(!navbarShown):
				$Tile1.visible=true
				$Tile2.visible=true
				$Tile3.visible=true
				$Tile4.visible=true
				$Tile5.visible=true
				$Tile6.visible=true
			#$EventNotification.visible=false
			
func _on_TextureButton_pressed():
	if(!navbarShown):
		$Tile1.visible=false
		$Tile2.visible=false
		$Tile3.visible=false
		$Tile4.visible=false
		$Tile5.visible=false
		$Tile6.visible=false
		$Button.visible=true
		$TextureButton.visible=false
		$AnimationPlayer.play("NavbarShow")
		navbarShown=true
	pass # Replace with function body.


func _on_Tile1_pressed():
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile2_pressed():
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile3_pressed():
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile4_pressed():
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile5_pressed():
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile6_pressed():
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Button_pressed():
	if(navbarShown):
		$Tile1.visible=true
		$Tile2.visible=true
		$Tile3.visible=true
		$Tile4.visible=true
		$Tile5.visible=true
		$Tile6.visible=true
		$Button.visible=false
		$TextureButton.visible=true
		$AnimationPlayer.play("NavbarHide")
		navbarShown=false
	pass # Replace with function body.
