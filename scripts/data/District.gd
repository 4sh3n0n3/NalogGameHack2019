extends Object

class_name District

""" @type: InfrastructureIndexStorage """
var storage
var unique_name
var avatar
const InfrastructureIndexStorage = preload("res://scripts/data/InfrastructureIndexStorage.gd")
const PATH_TO_SAVE = "res://config/Save.cfg"
const DataGenerator = preload("res://scripts/data/generator/InfrastructureIndexStorageDataGenerator.gd")

const Config = preload("res://scripts/config/InfrastructureIndexStorageConfigLoader.gd")
const PATH_TO_CONFIG="res://config/Districts.cfg"

"""
Constructor
@method _init
@return void
"""
func _init(unique_name):
	# TODO: Load values for storage from saved data
	# TODO: Load infrastucture -> indexes links from config
	self.unique_name = unique_name
	
	var savefile = ConfigFile.new()
	var err = savefile.load(PATH_TO_SAVE)
	if err == OK:
		if savefile.has_section("CREATED"):
			var infdata = savefile.get_value(unique_name, "dist_infrs")
			var inds = savefile.get_value(unique_name, "dist_indxs")
			self.storage = InfrastructureIndexStorage.new(infdata, inds)
			return
	var new_data = DataGenerator.generate(Config.load_file(PATH_TO_CONFIG))
	self.storage = InfrastructureIndexStorage.new(new_data["infrastructures"], new_data["indexes"])

"""
Returns district storage
@method get__storage
@return InfrastructureIndexStorage
"""
func get__storage():
	return self.storage
