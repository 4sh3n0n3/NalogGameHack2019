extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var TaxSchema=get_node("/root/TaxSchema")
onready var Saves=get_node("/root/save_script")
const City=preload("res://scripts/data/City.gd")
var city
var avatar
var mainIndex=0
# Called when the node enters the scene tree for the first time.
func _ready():
	city=City.new(Saves.load_data())
	update()
	pass # Replace with function body.
func update():
	mainIndex=0
	var indexes=city.get__averages_of_districts_indexes()
	for key in indexes.keys():
		mainIndex += indexes[key]
	mainIndex/=4
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
