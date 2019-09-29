"""
Loads configuration for InfrastructureIndexStorage
"""

extends Object

class_name InfrastructureIndexStorageConfigLoader

static func load_file(path: String):
	var configfile = ConfigFile.new()
	var err = configfile.load(path)
	if err == OK:
		var config = {}
		for inf in configfile.get_sections():
			config[inf] = configfile.get_value(inf, "indexes")
		return config
	return err
