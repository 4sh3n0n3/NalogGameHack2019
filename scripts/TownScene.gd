extends Node2D
var navbarShown=false
var menuBtnImg=Image.new()
var backBtnImg=Image.new()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	menuBtnImg.load("res://assets/menu.png")
	backBtnImg.load("res://assets/back.jpg")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	var texture=ImageTexture.new()
	if(!navbarShown):
		$AnimationPlayer.play("NavbarShow")
		navbarShown=true
		texture.create_from_image(backBtnImg)
	else:
		$AnimationPlayer.play("NavbarHide")
		navbarShown=false
		texture.create_from_image(menuBtnImg)
	$TextureButton.texture_normal=texture
	pass # Replace with function body.
