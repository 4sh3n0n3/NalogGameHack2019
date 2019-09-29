extends Node2D

const PATH_TO_SAVE = "res://config/Save.cfg"
const Avatar = preload("res://scripts/Avatar.gd")
const District = preload("res://scripts/data/District.gd")
const City = preload("res://scripts/data/City.gd")
const InfrastructureIndexStorage = preload("res://scripts/data/InfrastructureIndexStorage.gd")
onready var Global=get_node("/root/Global")

static func save_data(city):
	var config = ConfigFile.new()
	var err = config.load(PATH_TO_SAVE)
	var dist
	if err == OK:
		config.set_value("CREATED", "value", true)
		config.set_value("City", "free_points", city.free_points)
		for key in city.districts.keys():
			dist = city.districts[key]
			if (dist.avatar):
				config.set_value(key, "avatar_name", dist.avatar.unique_name)
				config.set_value(key, "avatar_points", dist.avatar.points)
				config.set_value(key, "avatar_schema", dist.avatar.taxSchema)
			config.set_value(key, "infrastructures", dist.storage.infstructs)
			config.set_value(key, "indexes", dist.storage.indexes)
		config.save(PATH_TO_SAVE)


static func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH_TO_SAVE)
	var dists = {}
	var city
	var dist
	if err == OK:
		for key in config.get_sections():
			if (key != "CREATED" && key != "City"):
				dist = District.new(key, true)
				if (config.has_section_key(key, "avatar_name")):
					var unique_name = config.get_value(key, "avatar_name")
					var taxSchema = config.get_value(key, "avatar_schema")
					var avatar = Avatar.new(taxSchema, unique_name)
					avatar.points = config.get_value(key, "avatar_points")
					dist.avatar = avatar
				var infstructs = config.get_value(key, "infrastructures")
				var indexes = config.get_value(key, "indexes")
				var storage = InfrastructureIndexStorage.new(infstructs, indexes)
				dist.storage = storage
				dists[key] = dist
		city = City.new(dists, config.get_value("City", "free_points"))
		print(city)
	return city
