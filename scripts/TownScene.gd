extends Node2D
var navbarShown=false
var curDistrict=1
#var evt_index=-1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_av=true
var is_ip=true
var tax_type=1
var avatar_name="Lawn"
onready var TaxShema=get_node("/root/TaxSchema")
onready var Global=get_node("/root/Global")
const Avatar=preload("res://scripts/Avatar.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	$EventNotification/av.pressed=true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var key="District"+str(curDistrict)
	if is_av:
		$EventNotification/avatar.visible=true
		$EventNotification/goverment.visible=false
		if(Global.city.districts[key].avatar == null):
			$EventNotification/avatar/Add.visible=true
			$EventNotification/avatar/Node2D.visible=false
		else:
			$EventNotification/avatar/Add.visible=false
			$EventNotification/avatar/Node2D.visible=true
			var avatar=Global.city.districts[key].avatar
			$EventNotification/avatar/Node2D/name.text=avatar.unique_name
			$EventNotification/avatar/Node2D/score.text=str(avatar.points)
			pass
		$TextureProgress.value=Global.mainIndex
	else:
		$EventNotification/avatar.visible=false
		$EventNotification/goverment.visible=true
		$EventNotification/goverment/first/Label2.text=str(Global.city.districts[key].storage.infstructs["medicine"])
		$EventNotification/goverment/first/Label3.text=str(Global.city.districts[key].storage.infstructs["education"])
		$EventNotification/goverment/Node2D/TextureProgress.value=Global.city.districts[key].storage.indexes["avg_income"]
		$EventNotification/goverment/Node2D/TextureProgress4.value=Global.city.districts[key].storage.indexes["crime_level"]
		$EventNotification/goverment/Node2D/TextureProgress2.value=Global.city.districts[key].storage.indexes["avg_age"]
		$EventNotification/goverment/Node2D/TextureProgress3.value=Global.city.districts[key].storage.indexes["mood"]
		pass
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
	curDistrict=1
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile2_pressed():
	curDistrict=2
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile3_pressed():
	curDistrict=3
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile4_pressed():
	curDistrict=4
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile5_pressed():
	curDistrict=5
	$Tile1.visible=false
	$Tile2.visible=false
	$Tile3.visible=false
	$Tile4.visible=false
	$Tile5.visible=false
	$Tile6.visible=false
	$EventNotification.visible=true
	pass # Replace with function body.


func _on_Tile6_pressed():
	curDistrict=6
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


func _on_gov_pressed():
	$EventNotification/av.pressed=false
	$EventNotification/gov.pressed=true
	is_av=false
	pass # Replace with function body.


func _on_Add_pressed():
	$EventNotification2.visible=true
	pass # Replace with function body.


func _on_IP_pressed():
	$EventNotification2.visible=false
	$EventNotification3.visible=true
	$EventNotification3/TextureButton.visible=true
	pass # Replace with function body.


func _on_YurLico_pressed():
	is_ip=false
	$EventNotification2.visible=false
	$EventNotification3.visible=true
	$EventNotification3/TextureButton.visible=false
	pass # Replace with function body.


func _on_TextureButton2_pressed():
	var key="District"+str(curDistrict)
	tax_type=2
	if (Global.city.free_points >= 50):
		Global.city.districts[key].storage.infstructs["medicine"] += 50
		Global.city.free_points -= 50
		save_script.save_data(Global.city)
	pass # Replace with function body.


func _on_TextureButton3_pressed():
	tax_type=3
	$EventNotification3.visible=false
	$EventNotification4.visible=true
	pass # Replace with function body.


func _on_TextureButton4_pressed():
	var key="District"+str(curDistrict)
	tax_type=4
	if (Global.city.free_points >= 50):
		Global.city.districts[key].storage.infstructs["education"] += 50
		Global.city.free_points -= 50
		save_script.save_data(Global.city)
	pass # Replace with function body.


func _on_TextureButton5_pressed():
	tax_type=5
	$EventNotification3.visible=false
	$EventNotification4.visible=true
	pass # Replace with function body.


func _on_TextureButton1_pressed():
	tax_type=1
	$EventNotification3.visible=false
	$EventNotification4.visible=true
	pass # Replace with function body.


func _on_ConfirmButton_pressed():
	name=$EventNotification4/LineEdit.text
	var a=0
	var b
	if is_ip:
		a=1
	match tax_type:
		1:
			b="ПСН"
		2:
			b="ЕНВД"
		3:
			b="ЕСХН"
		4:
			b="ОСН"
		5:
			b="УСН"
	var schema=TaxSchema.shemas[[a, b]]
	var avatar=Avatar.new(schema,name)
	Global.avatar=avatar
	$EventNotification4.visible=false
	pass # Replace with function body.


func _on_av_pressed():
	is_av=true
	$EventNotification/av.pressed=true
	$EventNotification/gov.pressed=false
	pass # Replace with function body.


func _on_Minigame_pressed():
	get_tree().change_scene("res://scenes/SpaceInvaders.tscn")
	pass # Replace with function body.
