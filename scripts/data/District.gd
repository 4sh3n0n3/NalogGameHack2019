extends Reference

var storage
const InfrastructureIndexStorage = preload("res://scripts/data/InfrastructureIndexStorage.gd")

"""
Constructor
@method _init
@return void
"""
func _init():
	# TODO: Load values for storage from saved data
	# TODO: Load infrastucture -> indexes links from config
	self.storage = InfrastructureIndexStorage.new({}, {})

"""
Returns district storage
@method get__storage
@return InfrastructureIndexStorage
"""
func get__storage():
	return self.storage
