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

"""
@method _init
@param infstructs Dictionary A dictionary of infrastructures
@param indexes Dictionary A dictionary of indexes
"""
func _init(infstructs: Dictionary, indexes: Dictionary):
	self.infstructs = infstructs
	self.indexes = indexes

"""
@method set_infrastructure
@param inf_key String Infrastructure key
@param inf_value int Infrastructure value
"""
func set_infrastructure(inf_key: String, inf_value: int):
	self.infstructs[inf_key] = inf_value
	for idx_key in self.infstruct_to_indexes_keys[inf_key]:
		self.indexes[idx_key] = inf_value

"""
@method set_index
@param idx_key String Index key
@param idx_value int Index value
"""
func setIndex(idx_key: String, idx_value: int):
	self.indexes[idx_key] = idx_value

"""
@method set_infrastructures_to_indexes_keys
@param inf_key String Infrastructure key
@param idx_keys Array Array of index keys
"""
func set_infrastructures_to_indexes_keys(inf_key: String, idx_keys: Array):
	self.infstruct_to_indexes_keys[inf_key] = idx_keys

"""
@method get_infrastructure
@param inf_key String
@return int
"""
func get_infrastructure(inf_key: String):
	return self.infstructs[inf_key]

"""
@method get_index
@param idx_key int Index key
@return int
"""
func get_ndex(idx_key: int):
	return self.indexes[idx_key]
