extends Node2D

const PATH_TO_SAVE = "res://config/Save.cfg"

static func save_data(city):
	var config = ConfigFile.new()
	var err = config.load(PATH_TO_SAVE)
	if err == OK:
		config.set_value("CREATED", "value", true)
		for dist in city.districts.values():
			if (dist.avatar):
				config.set_value(dist, "avatar_name", dist.avatar.unique_name)
				config.set_value(dist, "avatar_points", dist.avatar.points)
				config.set_value(dist, "avatar_schema", dist.avatar.taxSchema)
			config.set_value(dist, "dist_infrs", dist.get__storage().infstructs)
			config.set_value(dist, "dist_indxs", dist.get__storage().indexes)
		config.save()

static func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH_TO_SAVE)
	var districts
	
	return districts