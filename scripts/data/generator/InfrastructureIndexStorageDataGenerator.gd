"""
Generates random data for InfrastructureIndexStorage
"""

extends Object

class_name InfrastructureIndexStorageDataGenerator

static func generate(inf_struct_index_strg_cfg: Dictionary):
	var data = {"infrastructures": {}, "indexes": {}}
	for inf_name in inf_struct_index_strg_cfg:
		data["infrastructures"][inf_name] = randi()%501
		for idx_name in inf_struct_index_strg_cfg[inf_name]:
			if !data["indexes"].has(idx_name):
				data["indexes"][idx_name] = {"sum": 0, "count": 0}
			data["indexes"][idx_name]["sum"] += data["infrastructures"][inf_name] * inf_struct_index_strg_cfg[inf_name][idx_name]
			data["indexes"][idx_name]["count"] += 1
	for idx_name in data["indexes"]:
		data["indexes"][idx_name] = floor(data["indexes"][idx_name]["sum"] / data["indexes"][idx_name]["count"])
	return data
