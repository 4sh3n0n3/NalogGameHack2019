"""
A storage for infrastructures levels and indexes values
"""
extends Object

class_name InfrastructureIndexStorage

""" @type:Dictionary """
var infstructs
""" @type:Dictionary """
var indexes
""" @type:Dictionary """
var infstruct_to_indexes_keys

const Config = preload("res://scripts/config/InfrastructureIndexStorageConfigLoader.gd")
const PATH_TO_CONFIG="res://config/Districts.cfg"

"""
Constructor
@method _init
@param infstructs Dictionary A dictionary of infrastructures
@param indexes Dictionary A dictionary of indexes
@return void
"""
func _init(infstructs: Dictionary, indexes: Dictionary):
	self.infstruct_to_indexes_keys = Config.load_file(PATH_TO_CONFIG)
	self.infstructs = infstructs
	self.indexes = indexes

"""
Sets value for specified infrastructure
@method set__infrastructure
@param inf_key String Infrastructure key
@param inf_value int Infrastructure value
@return void
"""
func set__infrastructure(inf_key: String, inf_value: int):
	self.infstructs[inf_key] = inf_value
	for idx_key in self.infstruct_to_indexes_keys[inf_key]:
		self.indexes[idx_key] = inf_value

"""
Sets value for specified index
@method set__index
@param idx_key String Index name
@param idx_value int Index value
@return void
"""
func set__index(idx_key: String, idx_value: int):
	self.indexes[idx_key] = idx_value

"""
Sets a link between infrastructure and indexes
@method set__infrastructures_to_indexes_keys
@param inf_key String Infrastructure name
@param idx_keys Array Array of index keys
@return void
"""
func set__infrastructures_to_indexes_keys(inf_key: String, idx_keys: Dictionary):
	self.infstruct_to_indexes_keys[inf_key] = idx_keys

"""
Returns infrastructure value
@method get__infrastructure
@param inf_key String Infrastructure name
@return float
"""
func get__infrastructure(inf_key: String):
	return self.infstructs[inf_key]

"""
Returns index value
@method get__index
@param idx_key String Index name
@return float
"""
func get__index(idx_key: String):
	return self.indexes[idx_key]

"""
Returns all indexes
@method get__indexes
@return Array
"""
func get__indexes():
	return self.indexes


func get__infrastructures():
	return self.infstructs
